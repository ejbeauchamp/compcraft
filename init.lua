local ROOT = "/beaucraft/"
local REPO = "ejbeauchamp/compcraft/master/"

local PROGRAMS = {
    "test",
    "mine"
};

local SRC_FILES = {
    "src/test"
};

function getFile(sourceFile, destFile)
    local gitCommand = "/openp/github get ".. REPO .. sourceFile .. ".lua " .. ROOT .. destFile;
    shell.run(gitCommand);
end

function buildRoot()
    -- Delete existing directory
    if fs.isDir(ROOT) then
        fs.delete(ROOT);
    end

    -- Create the root directory
    fs.makeDir(ROOT);
end

function getFiles()
    -- Fetch all programs.  These will not end in '.lua'
    for i, file in ipairs(PROGRAMS) do
        getFile(file, file)
    end

    -- Fetch all src files. These are shared between programs
    for i, file in ipairs(SRC_FILES) do
        getFile(file, file..".lua")
    end
end

-- Run
buildRoot();
getFiles();