return {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    init = function()
        -- Claude Code's fullscreen renderer uses the alternate screen buffer,
        -- which breaks scrollback inside nvim :term buffers (can't scroll past
        -- the visible region). Force the classic renderer for claude launched
        -- from nvim; plain-tmux sessions outside nvim are unaffected.
        vim.env.CLAUDE_CODE_DISABLE_ALTERNATE_SCREEN = "1"

        -- Coalesce streamed bracketed paste phases inside :term buffers so
        -- Claude Code sees one paste event instead of fragments.
        -- https://github.com/coder/claudecode.nvim/issues/161
        local chunks = {}
        local orig_paste = vim.paste
        vim.paste = function(lines, phase)
            if vim.bo.buftype ~= "terminal" or phase == -1 then
                return orig_paste(lines, phase)
            end
            if phase == 1 then
                chunks = {}
            end
            for _, line in ipairs(lines) do
                chunks[#chunks + 1] = line
            end
            if phase == 3 then
                local buffered = chunks
                chunks = {}
                return orig_paste(buffered, -1)
            end
            return true
        end
    end,
    -- Terminal <esc> uses the snacks default: single passes to Claude,
    -- double (within 200ms) switches to normal mode.
    opts = {},
    keys = {
        { "<leader>a", nil, desc = "AI/Claude Code" },
        { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
        { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
        { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
        { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
        { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
        { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
        { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
        {
            "<leader>as",
            "<cmd>ClaudeCodeTreeAdd<cr>",
            desc = "Add file",
            ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
        },
        -- Diff management
        { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
        { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
    },
}
