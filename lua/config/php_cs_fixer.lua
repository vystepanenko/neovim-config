local fs = require('efmls-configs.fs')

local formatter = 'php-cs-fixer'
local args = "fix --quiet --using-cache=no --config=/home/cannibal/.php-cs-fixer.php '${INPUT}'"
local command = string.format('%s %s', fs.executable(formatter, fs.Scope.COMPOSER), args)

return {
  formatCommand = command,
  formatStdin = false,
}
