-- https://www.schemastore.org/json/
-- https://github.com/b0o/SchemaStore.nvim

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
