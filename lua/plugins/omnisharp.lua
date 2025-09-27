return {
  'omnisharp/omnisharp-vim',
  config = function()
    vim.g.OmniSharp_selector_ui = 'fzf'

    vim.g.OmniSharp_server_use_mono = 1
    vim.g.OmniSharp_server_use_net6 = 1
    vim.g.OmniSharp_server_use_net7 = 1
    vim.g.OmniSharp_server_use_net8 = 1

    -- WARNING: turning this on will cause OmniSharp to reinstall itself every
    -- nvim startup and also not work.
    vim.g.OmniSharp_translate_cygwin_wsl = 0

    --[[
# OmniSharp

OmniSharp is installed via `:OmniSharpInstall`.

When troubleshooting, here are some helpful things to use:

- `COREHOST_TRACE=1 COREHOST_TRACEFILE=/tmp/host_trace.txt vi`
- `dotnet --info`

## Common Problems

### `libhostfxr.so` not found

OmniSharp is not a self-contained app since it lacks `libhostfxr.so`, so
OmniSharp will need to find that in the runtime. Sometimes, there is a
`/etc/dotnet/install_location*` file, which seems to always point to
`/usr/lib/dotnet/`, which is incorrect: it should be `/usr/share/dotnet` (which
contains `/usr/share/dotnet/host/fxr/6.0.30/libhostfxr.so`).

    --]]
    local omnisharp_bin = '/home/sawyer/.cache/omnisharp-vim/omnisharp-roslyn/OmniSharp'

    local pid = vim.fn.getpid()
    require('lspconfig').omnisharp.setup {
      on_attach = function(_, bufnr)
        -- specifies what to do when language server attaches to the buffer
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
        -- NOTE: here's the nvim 0.10.0 version of the prior line (prob):
        -- vim.api.nvim_set_option_value('omnifunc', 'v:lua.vim.lsp.omnifunc', { buf = bufnr })
      end,
      capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
      cmd = { omnisharp_bin, '--languageserver', '--hostPID', tostring(pid) },
    }
  end,
}
