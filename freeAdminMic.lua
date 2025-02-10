-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiler will be improved soon!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-02-08 20:43:51
-- Luau version 6, Types version 3
-- Time taken: 0.004209 seconds

local Parent_upvr_2 = require(script.Parent)
local LocalPlayer_upvr_2 = game.Players.LocalPlayer
local Character_3 = LocalPlayer_upvr_2.Character
if not Character_3 then
	Character_3 = LocalPlayer_upvr_2.CharacterAdded:Wait()
end
local tbl_upvr_2 = {28828491, 668004411, 26610878, 951459548}
Parent_upvr_2.Initialize(Character_3:WaitForChild("Humanoid"))
local function ownsAnyGamePass_upvr(arg1) -- Line 17, Named "ownsAnyGamePass"
	--[[ Upvalues[1]:
		[1]: tbl_upvr_2 (readonly)
	]]
	for _, v in ipairs(tbl_upvr_2) do
		if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(arg1.UserId, v) then
			return true
		end
	end
	return false
end
local function _(arg1) -- Line 27, Named "promptPurchase"
	--[[ Upvalues[1]:
		[1]: LocalPlayer_upvr_2 (readonly)
	]]
	game:GetService("MarketplaceService"):PromptGamePassPurchase(LocalPlayer_upvr_2, arg1)
end
for _, v_2_upvr in ipairs(script.Parent.Parent:GetChildren()) do
	if v_2_upvr:IsA("Frame") then
		local class_TextButton_2 = v_2_upvr:FindFirstChildOfClass("TextButton")
		if class_TextButton_2 then
			local class_Animation_upvr_3 = class_TextButton_2:FindFirstChildOfClass("Animation")
			if class_Animation_upvr_3 then
				class_TextButton_2.MouseButton1Click:Connect(function() -- Line 38
					--[[ Upvalues[5]:
						[1]: v_2_upvr (readonly)
						[2]: ownsAnyGamePass_upvr (readonly)
						[3]: LocalPlayer_upvr_2 (readonly)
						[4]: Parent_upvr_2 (readonly)
						[5]: class_Animation_upvr_3 (readonly)
					]]
					--if v_2_upvr.Name:find("Vip") then
					--	if ownsAnyGamePass_upvr(LocalPlayer_upvr_2) then
					--		Parent_upvr_2.PlayAnimation(class_Animation_upvr_3)
					--	else
					--		warn("You need a game pass to use this animation.")
					--		game:GetService("MarketplaceService"):PromptGamePassPurchase(LocalPlayer_upvr_2, 951459548)
					--	end
					--end
					Parent_upvr_2.PlayAnimation(class_Animation_upvr_3)
				end)
			end
		end
	end
end
local Stop = script.Parent.Parent.Parent:FindFirstChild("Stop")
if Stop then
	local class_TextButton_4 = Stop:FindFirstChildOfClass("TextButton")
	if class_TextButton_4 then
		class_TextButton_4.MouseButton1Click:Connect(function() -- Line 61
			--[[ Upvalues[1]:
				[1]: Parent_upvr_2 (readonly)
			]]
			Parent_upvr_2.StopCurrentAnimation()
		end)
	end
end
