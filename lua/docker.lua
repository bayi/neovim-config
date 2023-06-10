-- require("docker").docker_client_toggle()
local M = {}

local Terminal = require("toggleterm.terminal").Terminal

local docker_tui = "lazydocker"

local docker_client = Terminal:new {
  cmd = docker_tui,
  dir = "git_dir",
  hidden = true,
  direction = "float",
  float_opts = {
    border = "double",
  },
}

function M.docker_client_toggle()
  docker_client:toggle()
end

return M
