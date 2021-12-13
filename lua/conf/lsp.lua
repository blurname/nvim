local lsp_installer = require "nvim-lsp-installer"
local M ={}


-- Include the servers you want to have installed by default below
local servers = {
  "sumneko_lua",
	"tsserver"
}

function M.setup()
	for _, name in pairs(servers) do
		local server_is_found, server = lsp_installer.get_server(name)
		if server_is_found then
			if not server:is_installed() then
				print("Installing " .. name)
				server:install()
			end
		end
	end
end

return M
