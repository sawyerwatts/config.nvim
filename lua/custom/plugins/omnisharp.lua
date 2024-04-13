return {
  'omnisharp/omnisharp-vim',
  settings = {
    FormattingOptions = {
      EnableEditorConfigSupport = true,
      OrganizeImports = true,
    },
    MsBuild = {
      -- If true, MSBuild project system will only load projects for files that
      -- were opened in the editor. This setting is useful for big C# codebases
      -- and allows for faster initialization of code navigation features only
      -- for projects that are relevant to code that is being edited. With this
      -- setting enabled OmniSharp may load fewer projects and may thus display
      -- incomplete reference lists for symbols.
      LoadProjectsOnDemand = nil,
    },
    RoslynExtensionsOptions = {
      -- Enables support for roslyn analyzers, code fixes and rulesets.
      EnableAnalyzersSupport = true,
      -- Enables support for showing unimported types and unimported extension
      -- methods in completion lists. When committed, the appropriate using
      -- directive will be added at the top of the current file. This option can
      -- have a negative impact on initial completion responsiveness,
      -- particularly for the first few completion sessions after opening a
      -- solution.
      EnableImportCompletion = nil,
      -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
      -- true
      AnalyzeOpenDocumentsOnly = nil,
    },
    Sdk = {
      -- Specifies whether to include preview versions of the .NET SDK when
      -- determining which version to use for project loading.
      IncludePrereleases = true,
    },
  },
  config = function()
    local pid = vim.fn.getpid()
    local omnisharp_bin = require('os').getenv 'HOME' .. '/.cache/omnisharp-vim/omnisharp-roslyn'
    require('lspconfig').omnisharp.setup {
      cmd = { omnisharp_bin, '--languageserver', '--hostPID', tostring(pid) },
    }

    vim.g.OmniSharp_server_user_mono = 0
    vim.g.OmniSharp_server_use_net6 = 1
    vim.g.OmniSharp_server_use_net8 = 1
    vim.g.OmniSharp_selector_ui = 'fzf'

    -- NOTE: when running on WSL, docs suggest this:
    --vim.g.OmniSharp_translate_cygwin_wsl = 1
  end,
}
