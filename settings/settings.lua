--//services

local HP = game:GetService("HttpService")

--//checking

assert(writefile,"Your exploit does not support writefile function.")
assert(readfile,"Your exploit does not support readfile function.")

-- //functions

getgenv().Load = function(FileName)
  if not FileName then return warn("Wrong Arguments!") end
  return HP:JSONDecode(readfile(FileName))
end

getgenv().Set = function(FileName,Settings)
  if not FileName or not Settings then return warn("Wrong Arguments!") end
  if FileName:match("/") then
    makefolder(FileName:sub(1,FileName:find("/") - 1))
  end
  writefile(FileName, HP:JSONEncode(Settings))
  Load(FileName,Settings)
end

getgenv().Update = function(FileName,Settings)
  if not FileName or not Settings then return warn("Wrong Arguments!") end
  local ExistingFile = pcall(readfile, FileName)
  if not ExistingFile then
    Set(FileName,Settings)
  else
    writefile(FileName, HP:JSONEncode(Settings))
  end
end
