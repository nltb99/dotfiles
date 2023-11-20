
lua << EOF

local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

mason.setup()

-- Start Handler
local M = {}

-- TODO: backfill this to template
M.setup = function()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		-- disable virtual text
		virtual_text = false,
		-- show signs
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
		width = 60,
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
		width = 60,
	})
end

local function lsp_highlight_document(client)
	-- Set autocommands conditional on server_capabilities
	local status_ok, illuminate = pcall(require, "illuminate")
	if not status_ok then
		return
	end
	illuminate.on_attach(client)
	-- end
end

local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = false }
	local keymap = vim.api.nvim_buf_set_keymap
end

M.on_attach = function(client, bufnr)
	vim.notify(client.name .. " starting...")

	-- TODO: refactor this into a method that checks if string in list
	if client.name == "tsserver" then
		client.resolved_capabilities.document_formatting = false
	end

	if client.name == "rust_analyzer" then
		vim.cmd([[
          augroup LspFormatting
              autocmd! * <buffer>
              autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
          augroup END
          ]])
	end

	lsp_keymaps(bufnr)
	lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	return
end

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

-- End handlers

-- Start jsonls

local default_schemas = nil
local status_ok, jsonls_settings = pcall(require, "nlspsettings.jsonls")
if status_ok then
	default_schemas = jsonls_settings.get_default_schemas()
end

local schemas = {
	{
		description = "TypeScript compiler configuration file",
		fileMatch = {
			"tsconfig.json",
			"tsconfig.*.json",
		},
		url = "https://json.schemastore.org/tsconfig.json",
	},
	{
		description = "Lerna config",
		fileMatch = { "lerna.json" },
		url = "https://json.schemastore.org/lerna.json",
	},
	{
		description = "Babel configuration",
		fileMatch = {
			".babelrc.json",
			".babelrc",
			"babel.config.json",
		},
		url = "https://json.schemastore.org/babelrc.json",
	},
	{
		description = "ESLint config",
		fileMatch = {
			".eslintrc.json",
			".eslintrc",
		},
		url = "https://json.schemastore.org/eslintrc.json",
	},
	{
		description = "Bucklescript config",
		fileMatch = { "bsconfig.json" },
		url = "https://raw.githubusercontent.com/rescript-lang/rescript-compiler/8.2.0/docs/docson/build-schema.json",
	},
	{
		description = "Prettier config",
		fileMatch = {
			".prettierrc",
			".prettierrc.json",
			"prettier.config.json",
		},
		url = "https://json.schemastore.org/prettierrc",
	},
	{
		description = "Vercel Now config",
		fileMatch = { "now.json" },
		url = "https://json.schemastore.org/now",
	},
	{
		description = "Stylelint config",
		fileMatch = {
			".stylelintrc",
			".stylelintrc.json",
			"stylelint.config.json",
		},
		url = "https://json.schemastore.org/stylelintrc",
	},
	{
		description = "A JSON schema for the ASP.NET LaunchSettings.json files",
		fileMatch = { "launchsettings.json" },
		url = "https://json.schemastore.org/launchsettings.json",
	},
	{
		description = "Schema for CMake Presets",
		fileMatch = {
			"CMakePresets.json",
			"CMakeUserPresets.json",
		},
		url = "https://raw.githubusercontent.com/Kitware/CMake/master/Help/manual/presets/schema.json",
	},
	{
		description = "Configuration file as an alternative for configuring your repository in the settings page.",
		fileMatch = {
			".codeclimate.json",
		},
		url = "https://json.schemastore.org/codeclimate.json",
	},
	{
		description = "LLVM compilation database",
		fileMatch = {
			"compile_commands.json",
		},
		url = "https://json.schemastore.org/compile-commands.json",
	},
	{
		description = "Config file for Command Task Runner",
		fileMatch = {
			"commands.json",
		},
		url = "https://json.schemastore.org/commands.json",
	},
	{
		description = "AWS CloudFormation provides a common language for you to describe and provision all the infrastructure resources in your cloud environment.",
		fileMatch = {
			"*.cf.json",
			"cloudformation.json",
		},
		url = "https://raw.githubusercontent.com/awslabs/goformation/v5.2.9/schema/cloudformation.schema.json",
	},
	{
		description = "The AWS Serverless Application Model (AWS SAM, previously known as Project Flourish) extends AWS CloudFormation to provide a simplified way of defining the Amazon API Gateway APIs, AWS Lambda functions, and Amazon DynamoDB tables needed by your serverless application.",
		fileMatch = {
			"serverless.template",
			"*.sam.json",
			"sam.json",
		},
		url = "https://raw.githubusercontent.com/awslabs/goformation/v5.2.9/schema/sam.schema.json",
	},
	{
		description = "Json schema for properties json file for a GitHub Workflow template",
		fileMatch = {
			".github/workflow-templates/**.properties.json",
		},
		url = "https://json.schemastore.org/github-workflow-template-properties.json",
	},
	{
		description = "golangci-lint configuration file",
		fileMatch = {
			".golangci.toml",
			".golangci.json",
		},
		url = "https://json.schemastore.org/golangci-lint.json",
	},
	{
		description = "JSON schema for the JSON Feed format",
		fileMatch = {
			"feed.json",
		},
		url = "https://json.schemastore.org/feed.json",
		versions = {
			["1"] = "https://json.schemastore.org/feed-1.json",
			["1.1"] = "https://json.schemastore.org/feed.json",
		},
	},
	{
		description = "Packer template JSON configuration",
		fileMatch = {
			"packer.json",
		},
		url = "https://json.schemastore.org/packer.json",
	},
	{
		description = "NPM configuration file",
		fileMatch = {
			"package.json",
		},
		url = "https://json.schemastore.org/package.json",
	},
	{
		description = "JSON schema for Visual Studio component configuration files",
		fileMatch = {
			"*.vsconfig",
		},
		url = "https://json.schemastore.org/vsconfig.json",
	},
	{
		description = "Resume json",
		fileMatch = { "resume.json" },
		url = "https://raw.githubusercontent.com/jsonresume/resume-schema/v1.0.0/schema.json",
	},
}

local function extend(tab1, tab2)
	for _, value in ipairs(tab2 or {}) do
		table.insert(tab1, value)
	end
	return tab1
end

local extended_schemas = extend(schemas, default_schemas)

local jsonlsOpts = {
	settings = {
		json = {
			schemas = extended_schemas,
		},
	},
	setup = {
		commands = {
			Format = {
				function()
					vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
				end,
			},
		},
	},
}

local pylsp_opts = { 
	-- TODO this will be improved in the future
    -- cmd = {"~/.pyenv/versions/3.10.2/bin/python", "pylsp" }, 
    settings = {
		pylsp = {
			plugins = {
				flake8 = {
					enabled = true,
					maxLineLength = 100,
				},
				black = { 
					enabled = true,
					args = {"--fast"},
				},
				pycodestyle = {
					enabled = false
				},
				pylint = {
					enabled = false
				},
				pyflakes = {
					enabled = false
				},
				mypy = {
                    enabled = false,
                },
			},
    	}
    },
}

local pyright_opts = { 
	settings = {
        python = {
            analysis = {
                autoImportCompletions = true,
                diagnosticMode = "workspace",
                typeCheckingMode = "off", -- Options: "strict," "basic," "off"
            },
            formatting = {
                provider = "black",
            },
            pyright = {
            },
        },
    },
}

-- End jsonls

local status_ok, lsp_installer = pcall(require, "mason-lspconfig")
if not status_ok then
	return
end

local lspconfig = require("lspconfig")

-- https://github.com/williamboman/mason-lspconfig.nvim
local servers = {
	"jsonls",
	"bashls",
	"yamlls",
	"tsserver",
	"eslint",
	"taplo",
	"rust_analyzer",
	"terraformls",
	"tsserver",
	"pyright",
}

lsp_installer.setup({
	ensure_installed = servers,
	automatic_installation = true,
})

for _, server in pairs(servers) do
	local opts = {
		on_attach = M.on_attach,
		capabilities = M.capabilities,
	}

	opts = vim.tbl_deep_extend("force", opts, jsonlsOpts)
	opts = vim.tbl_deep_extend("force", pylsp_opts, opts)
	opts = vim.tbl_deep_extend("force", pyright_opts, opts)

	lspconfig[server].setup(opts)
end

EOF


