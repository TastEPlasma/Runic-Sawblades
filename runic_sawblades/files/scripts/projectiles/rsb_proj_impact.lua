dofile_once("data/scripts/lib/utilities.lua")

function collision_trigger(entity_id2)
	local proj_entity_id = GetUpdatedEntityID()
	local root_id = EntityGetRootEntity(proj_entity_id)
	local storage = EntityGetComponent( root_id, "VariableStorageComponent")
	local proj_comp = EntityGetComponent( root_id, "ProjectileComponent")
	local who_shot = ComponentGetValue2( proj_comp, "mWhoShot")
	local held_item 
	local material_type
	local material_add_amount
	local availabletypes = {"acid", "alcohol", "blood", "material_confusion", "blood_cold", "coal", "magic_liquid_faster_levitation_and_movement",
						"lava", "liquid_fire", "silver_molten", "milk", "mimic_liquid", "poison", "purifying_powder", "slime", "radioactive_liquid", "rainbow_gas", "water", "blood_worm"} --"magic_gas_hp_regeneration" - removed for balance

	if storage ~= nil then
		for m, n in ipairs(storage) do
			if(ComponentGetValue2(n,"name")) == "material_type" then
				material_type = ComponentGetValue2(n,"value_string")
				if(material_type == "scintillating") then
					local rndtype = math.random(1,11)					
					material_type = availabletypes[rndtype]
					ComponentSetValue2(n, "value_string", material_type)
				end
			end
			if(ComponentGetValue2(n,"name")) == "added_material_per_hit" then
				material_add_amount = ComponentGetValue2(n,"value_float")
			end
		end
	end

	local comp = EntityGetFirstComponent(entity_id2, "DamageModelComponent")
	if ( comp ~= nil ) then
		ComponentSetValue2( comp, "blood_material", material_type )
		ComponentSetValue2( comp, "blood_spray_material", material_type)

		local current_amount = ComponentGetValue2(comp, "blood_multiplier")
		if(current_amount < 3 and current_amount > 0.2) then  --Need to cap, otherwise this can get wildly out of hand
			ComponentSetValue2( comp, "blood_multiplier", (material_add_amount + current_amount))
		end
	end
end