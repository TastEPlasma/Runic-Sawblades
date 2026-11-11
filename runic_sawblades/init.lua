dofile_once( "data/scripts/lib/utilities.lua" )

--[[

function OnModPreInit()
	print("Mod - OnModPreInit()") -- First this is called for all mods
end

function OnModInit()
	print("Mod - OnModInit()") -- After that this is called for all mods
end

function OnModPostInit()
	print("Mod - OnModPostInit()") -- Then this is called for all mods
end

]]--

function OnPlayerSpawned( player_entity ) -- This runs when player entity has been created
	local x, y = EntityGetTransform(player_entity)
  -- CreateItemActionEntity("RUNICSAWBLADE_ACID", x+20, y)
  -- CreateItemActionEntity("RUNICSAWBLADE_BLOOD", x+30, y)
  -- CreateItemActionEntity("RUNICSAWBLADE_FLUMMOXIUM", x+40, y)
  -- CreateItemActionEntity("RUNICSAWBLADE_FREEZING", x+50, y)
  -- CreateItemActionEntity("RUNICSAWBLADE_HASTIUM", x+60, y)
  -- CreateItemActionEntity("RUNICSAWBLADE_HEALIUM", x+70, y)
  -- CreateItemActionEntity("RUNICSAWBLADE_LAVA", x+80, y)
  -- CreateItemActionEntity("RUNICSAWBLADE_MIMICIUM", x+90, y)
  -- CreateItemActionEntity("RUNICSAWBLADE_POISON", x+100, y-20)
  -- CreateItemActionEntity("RUNICSAWBLADE_SCINTILLATING", x-20, y)
  -- CreateItemActionEntity("RUNICSAWBLADE_SLIME", x-30, y)
  -- CreateItemActionEntity("RUNICSAWBLADE_TOXIC", x-40, y)
  -- CreateItemActionEntity("RUNICSAWBLADE_WATER", x-50, y)
end

--[[

function OnWorldInitialized() -- This is called once the game world is initialized. Doesn't ensure any world chunks actually exist. Use OnPlayerSpawned to ensure the chunks around player have been loaded or created.
	GamePrint( "OnWorldInitialized() " .. tostring(GameGetFrameNum()) )
end

function OnWorldPreUpdate() -- This is called every time the game is about to start updating the world
	GamePrint( "Pre-update hook " .. tostring(GameGetFrameNum()) )
end

function OnWorldPostUpdate() -- This is called every time the game has finished updating the world
	GamePrint( "Post-update hook " .. tostring(GameGetFrameNum()) )
end

]]--

-- This code runs when all mods' filesystems are registered
ModLuaFileAppend( "data/scripts/gun/gun_actions.lua", "mods/runic_sawblades/files/actions.lua" )
