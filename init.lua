if vim.g.vscode then
    print("I'm in vscode")
    require("cursor")
else
    require("parth")
end
