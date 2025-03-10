-- Mobile script (COPY ALL OF IT!)
--[[
    Animation Packages: Zombie, Catwalk Glam, Elder, Cartoony, Adidas,
    Adidas, Werewolf, Vampire, Astronaut,
    Superhero, Knight, Mage, Ninja,
    Toy, NFL, No Boundaries, Oldschool,
    Pirate, Levitation, Bubbly, Robot,
    Wicked Popular, Bold, Stylish,
    Rthro [default Roblox Animation package]
--]]

local Zacks_Easy_Configuration = {
    -- Get the Animation Package names from the list provided above.
    Emote_Keybinds = true, -- true/false (true is on, false is off)
    Default_Animation_Package_System = true,
    Animation_Package_Idle = "Zombie",
    Animation_Package_Walk = "Zombie",
    Animation_Package_Run = "Zombie",
    Animation_Package_Fall = "Bold",
    Animation_Package_Jump = "Levitation",
    Animation_Package_Climb = "Toy",
    Death_On_Load = true, -- true/false (true is on, false is off)
    AntiAFK = true, -- true/false (true is on, false is off)
    Fully_Loaded_Messaging = false, -- true/false (true is on, false is off)
    Fully_Loaded_Message = "Example Message.", -- Custom message you want to chat when the script fully loads all the way.
    Huge_Baseplate = true, -- true/false (true is on, false is off)
    Script_Clock_Time_GUI = true, -- true/false (true is on, false is off)
    Anti_Suspend_VC = true, -- true/false (true is on, false is off)
    Infinite_Yield_Premium = true, -- true/false (true is on, false is off)
    Performance_Statistics = false, -- true/false (true is on, false is off)
    Old_Materials = false, -- true/false (true is on, false is off)
}

getgenv().Easies_Configuration = getgenv().Easies_Configuration or {}

for key, value in pairs(Zacks_Easy_Configuration) do
    if getgenv().Easies_Configuration[key] == nil then
        getgenv().Easies_Configuration[key] = value
    end
end
wait(0.1)
loadstring(game:HttpGet(('https://raw.githubusercontent.com/EnterpriseExperience/MicUpSource/refs/heads/main/retrieve_branch_version.lua')))()
loadstring(game:HttpGet('https://raw.githubusercontent.com/healer-op/HealCast/refs/heads/main/findFriendsLocal.lua'))()
