--//services

local HP = game:GetService("HttpService")

--//checking

if not writefile or not readfile then return error("Your exploit does not support writefile or readfile function.") end

-- //functions

getgenv().Set = function(FileName,Settings)
    if FileName:match("/") then
        makefolder(FileName:sub(1,FileName:find("/") - 1))
    end
    writefile(FileName, http:JSONEncode(Settings))
    Load(FileName,Settings)
end

getgenv().Update = function(FileName,Settings)
    local NewSettings = {}
    for i,v in pairs(Settings) do
        NewSettings[i] = v
    end
    writefile(FileName, http:JSONEncode(NewSettings))
end

getgenv().Load = function(FileName,Settings)
    local LoadedSettings = http:JSONDecode(readfile(FileName))
    for i,v in pairs(Settings) do
        v = LoadedSettings[tostring(i)]
    end
end
