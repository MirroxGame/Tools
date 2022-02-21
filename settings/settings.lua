--//services

local HP = game:GetService("HttpService")

--//checking

assert(writefile,"Your exploit does not support writefile function.")
assert(readfile,"Your exploit does not support readfile function.")
        
-- //functions

getgenv().Load = function(FileName,Settings)
    print(readfile(FileName))
    print(HP:JSONDecode(readfile(FileName)))
    return HP:JSONDecode(readfile(FileName))
end

getgenv().Set = function(FileName,Settings)
    if FileName:match("/") then
        makefolder(FileName:sub(1,FileName:find("/") - 1))
    end
    writefile(FileName, HP:JSONEncode(Settings))
    Load(FileName,Settings)
end

getgenv().Update = function(FileName,Settings)
    local NewSettings = {}
    for i,v in pairs(Settings) do
        NewSettings[i] = v
    end
    writefile(FileName, HP:JSONEncode(NewSettings))
end
