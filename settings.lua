local http = game:GetService("HttpService")

-- //functions

getgenv().Set = function(file,settings)
    if writefile and readfile then
        writefile(file, http:JSONEncode(settings))
        Load(file,settings)
    end
end

getgenv().Update = function(file,settings)
    if writefile and readfile then
        local NewSettings = {}
        for i,v in pairs(settings) do
            NewSettings[i] = v
        end
        writefile(file, http:JSONEncode(NewSettings))
    end
end

getgenv().Load = function(file,settings)
    if writefile and readfile then
       local LoadedSettings = http:JSONDecode(readfile(file))
       for i,v in pairs(settings) do
           v = LoadedSettings[tostring(i)]
       end
    end
end
