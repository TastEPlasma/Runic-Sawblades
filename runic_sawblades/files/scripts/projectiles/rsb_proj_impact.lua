dofile_once("data/scripts/lib/utilities.lua")

function collision_trigger(entity_id2)
	local proj_entity_id = GetUpdatedEntityID()
	local root_id = EntityGetRootEntity(proj_entity_id)
	local storage = EntityGetComponent( root_id, "VariableStorageComponent")
	local enemy_damage_comp = EntityGetFirstComponent(entity_id2, "DamageModelComponent")
	local enemy_variable_comp = EntityGetComponent(entity_id2, "VariableStorageComponent")
	local enemy_tags = EntityGetTags(entity_id2)
	local blood_is_changed = false
	local current_blood_type = ComponentGetValue2(enemy_damage_comp, "blood_material")
	local material_type
	local material_add_amount
	local relevant_interaction_entry
	local projectile_storage_comp
	local availabletypes = {"acid", "alcohol", "blood", "material_confusion", "blood_cold", "coal", "magic_liquid_faster_levitation_and_movement",
						"lava", "liquid_fire", "silver_molten", "milk", "mimic_liquid", "poison", "purifying_powder", "slime", "radioactive_liquid", "rainbow_gas", "water", "blood_worm"} --"magic_gas_hp_regeneration" - removed for balance

	local table_of_interactions = {
			["acid"] = {
				["poison"] = "poison_gas",
				["radioactive_liquid"] = "radioactive_gas",
				["slime"] = "oil"
			},
			["blood"] = {
				["acid"] = "acid_gas",
				["poison"] = "alcohol",
				["radioactive_liquid"] = "urine"
			},
			["magic_liquid_mana_regeneration"] = {
				["blood_cold"] = "blood_worm",
				["slime"] = "silver"
			},
			["cursed_liquid"] = {
				["blood_fading"] = "copper",
				["water"] = "ominous_liquid"
			},
			["material_confusion"] = {
				["acid"] = "vomit",
				["lava"] = "water_ice",
				["radioactive_liquid"] = "magic_liquid_mana_regeneration",
				["oil"] = "water",
				["water"] = "oil",
				["blood_cold"] = "lava" 
			},
			["blood_cold"] = {
				["oil"] = "magic_liquid_worm_attractor",
				["water"] = "slush"
			},
			["magic_liquid_movement_faster"] = {
				["blood_cold"] = "brass",
				["acid"] = "glass_broken"
			},
			["magic_gas_hp_regeneration"] = {
				["lava"] = "acid_gas",
				["poison"] = "magic_liquid_random_polymorph",
				["radioactive_liquid"] = "magic_gas_weakness"
			},
			["lava"] = {
				["blood_cold"] = "slush",
				["oil"] = "liquid_fire",
				["water"] = "steam"
			},
			["magic_liquid_faster_levitation"] = {
				["acid"] = "water_salt",
				["lava"] = "glass_broken_molten",
				["oil"] = "magic_liquid_faster_levitation"
			},
			["material_rainbow"] = {
				["acid"] = "peat",
				["blood_cold"] = "magic_liquid_invisibility",
				["lava"] = "gold_molten",
				["oil"] = "pus",
				["poison"] = "material_darkness",
				["slime"] = "magic_liquid_polymorph",
				["radioactive_liquid"] = "sulphur",
				["water"] = "milk"
			},
			["poison"] = {
				["blood_fading"] = "alcohol",
				["slime"] = "radioactive_liquid",
				["water"] = "poo"
			},
			["slime"] = {
				["lava"] = "cloud_slime",
				["slime"] = "blood_fungi"
			},
			["radioactive_liquid"] = {
				["acid"] = "radioactive_gas",
				["poison"] = "cursed_liquid",
				["water"] = "water"
			},
			["water"] = {
				["blood_cold"] = "water_ice",
				["slime"] = "pea_soup",
				["oil"] = "material_confusion"
			}
		}

	if(ModIsEnabled("Apotheosis")) then
		table_of_interactions["magic_liquid_faster_levitation"]["oil"] = "apotheosis_magic_liquid_infinite_flight"
	end

	--Get variables out of storage
	if storage ~= nil then
		for m, n in ipairs(storage) do
			if(ComponentGetValue2(n,"name")) == "material_type" then
				projectile_storage_comp = n
				material_type = ComponentGetValue2(projectile_storage_comp,"value_string")
				relevant_interaction_entry = table_of_interactions[material_type]
			end
			if(ComponentGetValue2(n,"name")) == "added_material_per_hit" then
				material_add_amount = ComponentGetValue2(n,"value_float")
			end
		end
	end

	--check for blood changed tag
	if(enemy_tags ~= nil) then
		local check = string.find(enemy_tags, "blood_changed")
		if(check ~= nil) then
			blood_is_changed = true
		end
	end

	if(material_type == "scintillating") then
		local rndtype = math.random(1,11)					
		material_type = availabletypes[rndtype]
		ComponentSetValue2(projectile_storage_comp, "value_string", material_type)
	elseif (relevant_interaction_entry ~= nil and not blood_is_changed) then
		local blood_entry = relevant_interaction_entry[current_blood_type]
		if(blood_entry ~= nil) then
			material_type = blood_entry
		end
		--store the original blood type, add tag 
		EntityAddTag(entity_id2, "blood_changed")
		EntityAddComponent2(entity_id2, "VariableStorageComponent", {
			name = "OriginalBloodMaterial",
			value_string = current_blood_type
		})
	elseif (relevant_interaction_entry ~= nil and blood_is_changed) then
		--get original blood material
		local OriginalBloodMaterial
		for i in enemy_variable_comp do
			if(i.name == "OriginalBloodMaterial") then
				OriginalBloodMaterial = i.value_string
			end
		end

		--check table against original blood material, if entry and current match reinforce material type
		local blood_entry = relevant_interaction_entry[OriginalBloodMaterial]
		if(blood_entry ~= nil and blood_entry == current_blood_type) then
			material_type = blood_entry
		end
	end

	if ( enemy_damage_comp ~= nil ) then
		ComponentSetValue2( enemy_damage_comp, "blood_material", material_type )
		ComponentSetValue2( enemy_damage_comp, "blood_spray_material", material_type)

		local current_amount = ComponentGetValue2(enemy_damage_comp, "blood_multiplier")
		if(current_amount < 3 and current_amount > 0.01) then  --Need to cap, otherwise this can get wildly out of hand
			ComponentSetValue2( enemy_damage_comp, "blood_multiplier", (material_add_amount + current_amount))
		end
	end
end