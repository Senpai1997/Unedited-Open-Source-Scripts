-- lol

local rps = game:GetService("ReplicatedStorage")
local run = game:GetService("RunService")
local tev = require(rps.Shared.Core.TEvent)
local plr = game.Players.LocalPlayer
local chr = plr.Character or plr.CharacterAdded:Wait()
local hrp = chr:WaitForChild("HumanoidRootPart")

run.Heartbeat:Connect(function()
    for _, obj in workspace:GetDescendants() do
        if obj:HasTag("Interactable") and obj:GetAttribute("en") then
            local dst = obj:GetAttribute("sz") or 20
            local prt = obj:IsA("Model") and obj.PrimaryPart or obj:IsA("BasePart") and obj
            if prt and (hrp.Position - prt.Position).Magnitude <= dst then
                tev.FireRemote("Interactable", obj)
            end
        end
    end
end)
