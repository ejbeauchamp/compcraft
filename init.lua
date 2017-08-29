
local ROOT = "/beaucraft/"
local REPO = "ejbeauchamp/compcraft/master/"
local FILES = {
    "test",
    "src/test"
};


-- Delete existing directory
if fs.isDir(ROOT) then
    fs.delete(ROOT);
end

-- Create the root directory
fs.makeDir(ROOT);

for i, file in ipairs(FILES) do
    local getFile = "/openp/github get ".. REPO .. file .. " " .. ROOT .. file;
    shell.run(getFile);
end