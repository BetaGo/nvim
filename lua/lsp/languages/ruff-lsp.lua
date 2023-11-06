local P = {}

function P.lsp_opts(opts)
	opts.on_attach = function(client, bufnr)
		-- Disable hover in favor of Pyright
		client.server_capabilities.hoverProvider = false
	end
end

return P
