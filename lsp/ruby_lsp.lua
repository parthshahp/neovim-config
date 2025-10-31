---@brief
---
--- Ruby LSP configuration for Neovim
---
--- This configures Ruby LSP to use `bundle exec ruby-lsp` so it can access
--- all the bundled gems in your project. This is essential for proper
--- hover information, completion, and other LSP features.
---
--- Make sure you have:
--- 1. ruby-lsp installed via Mason
--- 2. ruby-lsp gem in your Gemfile (or bundle install will include it)
--- 3. bundle install run in your project root

return {
  cmd = { 'bundle', 'exec', 'ruby-lsp' },
  filetypes = { 'ruby' },
  root_markers = { 'Gemfile', '.git', '.ruby-version' },
  settings = {
    rubyLsp = {
      -- Enable features
      features = {
        hover = true,
        codeActions = true,
        codeLens = true,
        diagnostics = true,
        documentHighlights = true,
        documentSymbols = true,
        foldingRanges = true,
        formatting = true,
        inlayHint = true,
        onTypeFormatting = true,
        selectionRanges = true,
        semanticHighlighting = true,
        signatureHelp = true,
        completion = true,
      },
    },
  },
  init_options = {
    -- Enable all features
    enabledFeatures = {
      'hover',
      'codeActions',
      'codeLens',
      'diagnostics',
      'documentHighlights',
      'documentSymbols',
      'foldingRanges',
      'formatting',
      'inlayHint',
      'onTypeFormatting',
      'selectionRanges',
      'semanticHighlighting',
      'signatureHelp',
      'completion',
    },
  },
}
