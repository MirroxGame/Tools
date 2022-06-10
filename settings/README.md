# Loader

```lua
 loadstring(game:HttpGet("https://raw.githubusercontent.com/MirroxGame/Tools/main/settings/settings.lua"))()
```

# Usage

```lua
local Settings = {
Key = "no"
}

local FileName = "ScriptNameSettings.json" -- must include a .json, change the 'ScriptNameSettings' to what you want

local ExistingFile = pcall(readfile, FileName)

if not ExistingFile then
 Set(FileName,Settings)
else
 Settings = Load(FileName)
end
```

# Functions

## Set

```lua
 <void> Set(<string> FileName, <table> Settings)
```

Saves `Settings` to `FileName`

## Update

```lua
 <void> Update(<string> FileName, <table> Settings)
```

Updates `FileName` with `Settings`

## Load

```lua
 <table> Load(<string> FileName)
```

Returns the `FileName` data

# Note

This project can contain bugs, if you find a bug make a pull request.
