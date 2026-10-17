-- nvim-treesitter `main`: the plugin only installs parsers/queries.
-- Highlight, indent and incremental selection are enabled per buffer below.
local parsers = {
    "markdown",
    "json",
    "javascript",
    "typescript",
    "yaml",
    "html",
    "css",
    "bash",
    "lua",
    "dockerfile",
    "gitignore",
    "gitcommit",
    "python",
    "vue",
    "php",
    "go",
    "hurl",
}

-- Incremental selection (removed from `main`): <Enter> starts / grows to
-- the parent node, <Backspace> shrinks back.
local selection_stack = {}

local function to_visual_range(node)
    local sr, sc, er, ec = node:range()
    -- range end is exclusive; ec == 0 means "up to the end of previous line"
    if ec == 0 and er > sr then
        er = er - 1
        ec = #vim.api.nvim_buf_get_lines(0, er, er + 1, false)[1]
    end
    return sr, sc, er, math.max(ec - 1, 0)
end

local function select_node(node)
    local sr, sc, er, ec = to_visual_range(node)
    if vim.fn.mode():match("[vV\22]") then
        vim.cmd("normal! \27")
    end
    vim.api.nvim_win_set_cursor(0, { sr + 1, sc })
    vim.cmd("normal! v")
    vim.api.nvim_win_set_cursor(0, { er + 1, ec })
end

local function current_visual_range()
    local a, b = vim.fn.getpos("v"), vim.fn.getpos(".")
    local sr, sc, er, ec = a[2] - 1, a[3] - 1, b[2] - 1, b[3] - 1
    if sr > er or (sr == er and sc > ec) then
        sr, sc, er, ec = er, ec, sr, sc
    end
    return sr, sc, er, ec
end

local function same_range(node, sr, sc, er, ec)
    local nsr, nsc, ner, nec = to_visual_range(node)
    return nsr == sr and nsc == sc and ner == er and nec == ec
end

local function init_selection()
    local node = vim.treesitter.get_node()
    if not node then
        return
    end
    selection_stack[vim.api.nvim_get_current_buf()] = { node }
    select_node(node)
end

local function node_incremental()
    local buf = vim.api.nvim_get_current_buf()
    local stack = selection_stack[buf]
    local sr, sc, er, ec = current_visual_range()

    -- Visual selection made by hand (or buffer edited): start from the
    -- smallest node that covers it
    if not stack or #stack == 0 or not same_range(stack[#stack], sr, sc, er, ec) then
        local node = vim.treesitter.get_node({ pos = { sr, sc } })
        while node and not vim.treesitter.node_contains(node, { sr, sc, er, ec + 1 }) do
            node = node:parent()
        end
        if not node then
            return
        end
        stack = { node }
        selection_stack[buf] = stack
        if not same_range(node, sr, sc, er, ec) then
            return select_node(node)
        end
    end

    local node = stack[#stack]
    local parent = node:parent()
    while parent and same_range(parent, to_visual_range(node)) do
        parent = parent:parent()
    end
    if parent then
        table.insert(stack, parent)
        select_node(parent)
    end
end

local function node_decremental()
    local stack = selection_stack[vim.api.nvim_get_current_buf()]
    if not stack or #stack < 2 then
        return
    end
    table.remove(stack)
    select_node(stack[#stack])
end

return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false, -- main does not support lazy-loading
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").install(parsers)

        vim.api.nvim_create_autocmd("FileType", {
            group = vim.api.nvim_create_augroup("treesitter-start", { clear = true }),
            callback = function(args)
                local lang = vim.treesitter.language.get_lang(args.match)
                if not lang or not pcall(vim.treesitter.start, args.buf, lang) then
                    return
                end

                if vim.treesitter.query.get(lang, "indents") then
                    vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end

                local opts = { buffer = args.buf }
                vim.keymap.set("n", "<Enter>", init_selection, vim.tbl_extend("force", opts, { desc = "Start node selection" }))
                vim.keymap.set("x", "<Enter>", node_incremental, vim.tbl_extend("force", opts, { desc = "Grow selection to parent node" }))
                vim.keymap.set("x", "<Backspace>", node_decremental, vim.tbl_extend("force", opts, { desc = "Shrink selection" }))
            end,
        })
    end,
}
