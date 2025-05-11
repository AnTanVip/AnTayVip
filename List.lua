local UniverseID = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://apis.roblox.com/universes/v1/places/"..game.PlaceId.."/universe")).universeId
if game.PlaceId == 116495829188952 or game.PlaceId == 70876832253163 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AnTanVip/AnTayVip/refs/heads/main/Dead-Raids.lua"))()
end