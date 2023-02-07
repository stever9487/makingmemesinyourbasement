local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt"))()
local window = library:Window("making memes in your basement at 3 AM tycoon gui")
local server = window:Server("main", "")
local main = server:Channel("main")
local tycoon
for i, v in pairs(game:GetService("Workspace").Tycoons:GetChildren()) do
    if v.Name:sub(1, 6) == "Tycoon" and v:FindFirstChild("TycoonOwner").Value == game:GetService("Players").LocalPlayer.Name then
        tycoon = v
        main:Label("tycoon: "..v.Name)
    end
end
if tycoon == nil then
    library:Notification("Error!", "You don\'t own a tycoon!", "idot")
end
main:Toggle("Auto-Upload", false, function(value)
    _G.AutoUploadEnabled = value
    while _G.AutoUploadEnabled do
        game:GetService("ReplicatedStorage").Events.MemeToStorage:FireServer()
        game:GetService("ReplicatedStorage").Events.UploadCurrentMemes:FireServer()
        wait()
    end
end)
main:Toggle("Auto-Collect", false, function(value)
    _G.AutoCollectEnabled = value
    while _G.AutoCollectEnabled do
        fireproximityprompt(tycoon.StaticItems.Belt1.Collect.CollectPart.ProximityPrompt)
        fireproximityprompt(tycoon.StaticItems.Belt2.Collect.CollectPart.ProximityPrompt)
        fireproximityprompt(tycoon.StaticItems.Belt3.Collect.CollectPart.ProximityPrompt)
    end
end)