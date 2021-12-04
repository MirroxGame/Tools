local http = game:GetService("HttpService")

-- //functions

getgenv().Set = function(FileName,Settings)
    if writefile and readfile then
        writefile(FileName, http:JSONEncode(Settings))
        Load(FileName,Settings)
    end
end

getgenv().Update = function(FileName,Settings)
    if writefile and readfile then
        local NewSettings = {}
        for i,v in pairs(Settings) do
            NewSettings[i] = v
        end
        writefile(FileName, http:JSONEncode(NewSettings))
    end
end

getgenv().Load = function(FileName,Settings)
    if writefile and readfile then
       local LoadedSettings = http:JSONDecode(readfile(FileName))
       for i,v in pairs(Settings) do
           v = LoadedSettings[tostring(i)]
       end
    end
end
