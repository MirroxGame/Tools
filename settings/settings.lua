--//services

local HttpService = game:GetService("HttpService")


--//variables

local ToCheck = {
    ["writefile"] = writefile,
    ["readfile"] = readfile,
    ["makefolder"] = makefolder
}


--//checker

for FunctionName,Function in pairs(ToCheck) do
    assert(Function,("Your exploit does not support %s function."):format(FunctionName))
end

--//functions

getgenv().Load = function(FileName)
    assert(FileName,"Wrong Arguments!")
    return HttpService:JSONDecode(readfile(FileName))
end

getgenv().Set = function(FileName,Table)
    assert(FileName or Table,"Wrong Arguments!")
    if FileName:match("/") then
        local prev = ""
        for line in FileName:gmatch("[^/]+") do
            if prev == "" then prev = line else prev = "/"..prev end
            makefolder(prev)
        end
    end
    writefile(FileName, HttpService:JSONEncode(Table))
end

getgenv().Update = function(FileName,Table)
    assert(FileName or Table,"Wrong Arguments!")
    local ExistingFile = pcall(readfile, FileName)
    if not ExistingFile then
        Set(FileName,Settings)
    else
        writefile(FileName, HttpService:JSONEncode(Settings))
    end
end
