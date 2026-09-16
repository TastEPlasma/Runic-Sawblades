Runic_Sawblades = {
	{
		id          = "RUNICSAWBLADE_ACID",
		name 		= "Stinging Runic Sawblade",
		description = "Alchemia Sanguinaria",
		sprite 		= "mods/runic_sawblades/files/ui_gfx/gun_actions/disc_bullet_acid.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "2,3,4,5,6", -- My Tier 2 
		spawn_probability                 = "0.4,0.6,1,0.7,0.5", 
		price = 500,
		mana = 40,
		-- max_uses = 3,
		action 		= function()
			add_projectile("mods/runic_sawblades/files/entities/projectiles/deck/acid_runeblade.xml")
			c.fire_rate_wait = c.fire_rate_wait + 18      	
		end,
	},
	{
		id          = "RUNICSAWBLADE_BLOOD",
		name 		= "Bloody Runic Sawblade",
		description = "Alchemia Sanguinaria",
		sprite 		= "mods/runic_sawblades/files/ui_gfx/gun_actions/disc_bullet_blood.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "0,1,2,3", -- My Tier 1
		spawn_probability                 = "0.6,0.6,1,0.4", 
		price = 350,
		mana = 10,
		-- max_uses = 3,
		action 		= function()
			add_projectile("mods/runic_sawblades/files/entities/projectiles/deck/blood_runeblade.xml")
        	c.fire_rate_wait = c.fire_rate_wait + 6
		end,
	},
	{
		id          = "RUNICSAWBLADE_FLUMMOXIUM",
		name 		= "Confusing Runic Sawblade",
		description = "Alchemia Sanguinaria",
		sprite 		= "mods/runic_sawblades/files/ui_gfx/gun_actions/disc_bullet_flummoxium.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "0,1,2,3", -- My Tier 1
		spawn_probability                 = "0.6,1,0.6,0.4", 
		price = 350,
		mana = 10,
		-- max_uses = 3,
		action 		= function()
			add_projectile("mods/runic_sawblades/files/entities/projectiles/deck/flummoxium_runeblade.xml")
        	c.fire_rate_wait = c.fire_rate_wait + 6
		end,
	},
	{
		id          = "RUNICSAWBLADE_FREEZING",
		name 		= "Frigid Runic Sawblade",
		description = "Alchemia Sanguinaria",
		sprite 		= "mods/runic_sawblades/files/ui_gfx/gun_actions/disc_bullet_freezing.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "0,1,2,3", -- My Tier 1
		spawn_probability                 = "0.6,1,0.6,0.4", 
		price = 350,
		mana = 20,
		-- max_uses = 3,
		action 		= function()
			add_projectile("mods/runic_sawblades/files/entities/projectiles/deck/freezing_runeblade.xml")
        	c.fire_rate_wait = c.fire_rate_wait + 9
		end,
	},
	{
		id          = "RUNICSAWBLADE_HASTIUM",
		name 		= "Impelled Runic Sawblade",
		description = "Alchemia Sanguinaria",
		sprite 		= "mods/runic_sawblades/files/ui_gfx/gun_actions/disc_bullet_hastium.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "3,4,5,6,7", -- My Tier 3
		spawn_probability                 = "0.3,0.5,0.8,1,0.8", 
		price = 700,
		mana = 50,
		-- max_uses = 3,
		action 		= function()
			add_projectile("mods/runic_sawblades/files/entities/projectiles/deck/hastium_runeblade.xml")
        	c.fire_rate_wait = c.fire_rate_wait - 12
		end,
	},
	{
		id          = "RUNICSAWBLADE_HEALIUM",
		name 		= "Soothing Runic Sawblade",
		description = "Alchemia Sanguinaria",
		sprite 		= "mods/runic_sawblades/files/ui_gfx/gun_actions/disc_bullet_healium.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "2,3,4,5,6,7,8,9,10", -- My Tier 4 -special for healing item
		spawn_probability                 = "0.1,0.2,0.3,0.4,0.5,0.8,0.8,0.8,1", 
		price = 1000,
		mana = 150,
		max_uses = 3,
		action 		= function()
			add_projectile("mods/runic_sawblades/files/entities/projectiles/deck/healium_runeblade.xml")
        	c.fire_rate_wait = c.fire_rate_wait + 30
		end,
	},
	{
		id          = "RUNICSAWBLADE_LAVA",
		name 		= "Searing Runic Sawblade",
		description = "Alchemia Sanguinaria",
		sprite 		= "mods/runic_sawblades/files/ui_gfx/gun_actions/disc_bullet_lava.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "2,3,4,5,6", -- My Tier 2 
		spawn_probability                 = "0.4,0.6,1,0.7,0.5", 
		price = 500,
		mana = 30,
		-- max_uses = 3,
		action 		= function()
			add_projectile("mods/runic_sawblades/files/entities/projectiles/deck/lava_runeblade.xml")
        	c.fire_rate_wait = c.fire_rate_wait + 12
		end,
	},
	{
		id          = "RUNICSAWBLADE_MIMICIUM",
		name 		= "Mirrored Runic Sawblade",
		description = "Alchemia Sanguinaria",
		sprite 		= "mods/runic_sawblades/files/ui_gfx/gun_actions/disc_bullet_mimicium.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "3,4,5,6,7", -- My Tier 3
		spawn_probability                 = "0.2,0.4,0.7,1,0.8", 
		price = 700,
		mana = 70,
		-- max_uses = 3,
		action 		= function()
			add_projectile("mods/runic_sawblades/files/entities/projectiles/deck/mimicium_runeblade.xml")
        	c.fire_rate_wait = c.fire_rate_wait + 20
		end,
	},
	{
		id          = "RUNICSAWBLADE_POISON",
		name 		= "Venomous Runic Sawblade",
		description = "Alchemia Sanguinaria",
		sprite 		= "mods/runic_sawblades/files/ui_gfx/gun_actions/disc_bullet_poison.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "2,3,4,5,6", -- My Tier 2 
		spawn_probability                 = "0.4,0.6,1,0.7,0.5", 
		price = 500,
		mana = 30,
		-- max_uses = 3,
		action 		= function()
			add_projectile("mods/runic_sawblades/files/entities/projectiles/deck/poison_runeblade.xml")
        	c.fire_rate_wait = c.fire_rate_wait + 12
		end,
	},
	{
		id          = "RUNICSAWBLADE_SCINTILLATING",
		name 		= "Scintillating Runic Sawblade",
		description = "Alchemia Sanguinaria",
		sprite 		= "mods/runic_sawblades/files/ui_gfx/gun_actions/disc_bullet_scintillating.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "2,3,4,5,6,7", -- My Tier 3 - modified to make this one slightly more common
		spawn_probability                 = "0.5,0.7,1,0.7,0.6,0.6", 
		price = 500,
		mana = 30,
		-- max_uses = 3,
		action 		= function()
			add_projectile("mods/runic_sawblades/files/entities/projectiles/deck/scintillating_runeblade.xml")
        	c.fire_rate_wait = c.fire_rate_wait + 12
		end,
	},
	{
		id          = "RUNICSAWBLADE_SLIME",
		name 		= "Slippery Runic Sawblade",
		description = "Alchemia Sanguinaria",
		sprite 		= "mods/runic_sawblades/files/ui_gfx/gun_actions/disc_bullet_slime.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "0,1,2,3", -- My Tier 1
		spawn_probability                 = "0.6,1,0.6,0.4", 
		price = 350,
		mana = 10,
		-- max_uses = 3,
		action 		= function()
			add_projectile("mods/runic_sawblades/files/entities/projectiles/deck/slime_runeblade.xml")
        	c.fire_rate_wait = c.fire_rate_wait + 6
		end,
	},
	{
		id          = "RUNICSAWBLADE_TOXIC",
		name 		= "Noxious Runic Sawblade",
		description = "Alchemia Sanguinaria",
		sprite 		= "mods/runic_sawblades/files/ui_gfx/gun_actions/disc_bullet_toxic.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "2,3,4,5,6", -- My Tier 2 
		spawn_probability                 = "0.4,0.6,1,0.7,0.5", 
		price = 500,
		mana = 30,
		-- max_uses = 3,
		action 		= function()
			add_projectile("mods/runic_sawblades/files/entities/projectiles/deck/toxic_runeblade.xml")
        	c.fire_rate_wait = c.fire_rate_wait + 12
		end,
	},
	{
		id          = "RUNICSAWBLADE_WATER",
		name 		= "Damp Runic Sawblade",
		description = "Alchemia Sanguinaria",
		sprite 		= "mods/runic_sawblades/files/ui_gfx/gun_actions/disc_bullet_water.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "0,1,2,3", -- My Tier 1
		spawn_probability                 = "1,0.6,0.6,0.4", 
		price = 350,
		mana = 10,
		-- max_uses = 3,
		action 		= function()
			add_projectile("mods/runic_sawblades/files/entities/projectiles/deck/water_runeblade.xml")
        	c.fire_rate_wait = c.fire_rate_wait + 6
		end,
	}
}

function InsertAllToTable()
	for k=1,#Runic_Sawblades
        do local v = Runic_Sawblades[k]
            table.insert(actions,v)
	end
end

InsertAllToTable()