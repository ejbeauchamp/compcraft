
local ROOT = "/beaucraft"
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

for file in FILES do
    print(file)
end