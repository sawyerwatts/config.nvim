return {
  { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Useful status updates for LSP.
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', opts = {} },

      -- `neodev` configures Lua LSP for your Neovim config, runtime and plugins
      -- used for completion, annotations and signatures of Neovim apis
      { 'folke/neodev.nvim', opts = {} },
    },
    config = function()
      --  This function gets run when an LSP attaches to a particular buffer.
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('SawyerLspAttach', { clear = true }),
        callback = function(event)
          local map = function(mode, keys, func, desc)
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          map('n', 'gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
          map('n', 'gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
          map('n', 'gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
          map('n', 'gD', require('telescope.builtin').lsp_type_definitions, '[G]oto [D]eclaration')
          map('n', 'gci', require('telescope.builtin').lsp_incoming_calls, '[G]oto [C]alls [I]ncoming')
          map('n', 'gco', require('telescope.builtin').lsp_outgoing_calls, '[G]oto [C]alls [O]utgoing')
          map('n', '<leader>cr', vim.lsp.buf.rename, '[C]ode [R]ename')
          map('n', '<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.server_capabilities.documentHighlightProvider then
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              callback = vim.lsp.buf.clear_references,
            })
          end

          ---------------------------------------------------------------------
          -- Goto prev/next document symbols
          ----------------------------------

          local get_prev_next_symbols = function(t)
            local curr_lnum, curr_col = unpack(vim.api.nvim_win_get_cursor(0))
            local prev_symbol_pos = nil
            local next_symbol_pos = nil

            for _, item in pairs(t.items) do
              local item_lnum = 1
              local item_col = 0
              for k, v in pairs(item) do
                if k == 'lnum' then
                  item_lnum = v
                elseif k == 'col' then
                  item_col = v - 1
                end
              end

              local item_pos = { item_lnum, item_col }
              if item_lnum < curr_lnum then
                prev_symbol_pos = item_pos
              elseif item_lnum > curr_lnum then
                next_symbol_pos = item_pos
                break
              elseif item_col < curr_col then
                prev_symbol_pos = item_pos
              elseif item_col > curr_col then
                next_symbol_pos = item_pos
                break
              end
            end

            return prev_symbol_pos, next_symbol_pos
          end

          local goto_prev_symbol = function(t)
            local prev_symbol_pos, _ = get_prev_next_symbols(t)
            if prev_symbol_pos == nil then
              vim.print 'No prev symbol in document'
              return
            end
            vim.api.nvim_win_set_cursor(0, prev_symbol_pos)
          end

          local goto_next_symbol = function(t)
            local _, next_symbol_pos = get_prev_next_symbols(t)
            if next_symbol_pos == nil then
              vim.print 'No next symbol in document'
              return
            end
            vim.api.nvim_win_set_cursor(0, next_symbol_pos)
          end

          -- TODO: the problem is w/ vim.lsp.buf??
          -- this works correctly:
          -- Demo = function()
          --   vim.api.nvim_win_set_cursor(0, { 10, 10 })
          -- end
          -- vim.keymap.set('n', '<leader>demo', '<cmd>lua Demo()<cr><C-g>')
          map({ 'n', 'v' }, '<M-i>', function()
            vim.lsp.buf.document_symbol { on_list = goto_next_symbol }
          end, 'Move to next document symbol (using modified Jumplist motions)')
          map({ 'n', 'v' }, '<M-o>', function()
            vim.lsp.buf.document_symbol { on_list = goto_prev_symbol }
          end, 'Move to prev document symbol (using modified Jumplist motions)')
        end,
      })

      -- LSP servers and clients are able to communicate to each other what features they support.
      --  By default, Neovim doesn't support everything that is in the LSP specification.
      --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
      --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      -- Enable the following language servers
      --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
      --
      --  Add any additional override configuration in the following tables. Available keys are:
      --  - cmd (table): Override the default command used to start the server
      --  - filetypes (table): Override the default list of associated filetypes for the server
      --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
      --  - settings (table): Override the default settings passed when initializing the server.
      --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
      local servers = {
        -- clangd = {},
        -- TODO: set up go
        --    https://github.com/golang/tools/blob/master/gopls/doc/vim.md
        --    https://github.com/golang/tools/blob/master/gopls/doc/inlayHints.md
        -- gopls = {},
        -- pyright = {},
        -- rust_analyzer = {},
        -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
        --
        -- Some languages (like typescript) have entire language plugins that can be useful:
        --    https://github.com/pmizio/typescript-tools.nvim
        --
        -- But for many setups, the LSP (`tsserver`) will work just fine
        -- tsserver = {},
        --

        lua_ls = {
          -- cmd = {...},
          -- filetypes = { ...},
          -- capabilities = {},
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
              -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
              -- diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },
      }

      -- Ensure the servers and tools above are installed
      --  To check the current status of installed tools and/or manually install
      --  other tools, you can run
      --    :Mason
      --
      --  You can press `g?` for help in this menu.
      require('mason').setup()

      -- You can add other tools here that you want Mason to install
      -- for you, so that they are available from within Neovim.
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua', -- Used to format Lua code
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            -- This handles overriding only values explicitly passed
            -- by the server configuration above. Useful when disabling
            -- certain features of an LSP (for example, turning off formatting for tsserver)
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
