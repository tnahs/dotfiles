-- https://github.com/b0o/SchemaStore.nvim
-- https://www.schemastore.org/json/
--
-- https://github.com/hrsh7th/vscode-langservers-extracted
-- required: npm i -g vscode-langservers-extracted

local ok, schemastore = pcall(require, "schemastore")
if not ok then
    print("Failed to load plugin: `b0o/SchemaStore.nvim`.")
    return {}
end

return {
    settings = {
        json = {
            schemas = schemastore.json.schemas(),
        },
    },
}
