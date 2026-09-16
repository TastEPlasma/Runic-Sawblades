dofile_once("data/scripts/gun/procedural/gun_action_utils.lua")
local EZWand = dofile_once("mods/runic_sawblades/EZWand.lua")
local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform( entity_id )
local radius = 12
local targets = EntityGetInRadiusWithTag( x, y, radius, "homing_target" )
local root_id = EntityGetRootEntity( entity_id )
local comp = EntityGetFirstComponent( root_id, "ProjectileComponent" )
local storage = EntityGetComponent( root_id, "VariableStorageComponent")
local target = ComponentGetValue2( comp, "mWhoShot" )
local update_material
local flag_comp
local countdown_amount

local function get_table_of_elements()
    local table_of_elements = {
        ["MANA_REDUCE"] = "magic_liquid_mana_regeneration",
        ["ARC_FIRE"] = "liquid_fire",
        ["ARC_GUNPOWDER"] = "gunpowder_unstable",
        ["ARC_POISON"] = "poison",
        --["ARC_ELECTRIC"] = "shock_powder", --can't find a suitable material 
        ["BOUNCE_EXPLOSION"] = "gunpowder_unstable",
        ["BLOODLUST"] = "magic_liquid_berserk",
        ["HITFX_EXPLOSION_ALCOHOL"] = "alcohol",
        ["COLOUR_RAINBOW"] = "material_rainbow",
        ["COLOUR_INVIS"] = "magic_liquid_invisibility",
        ["FIZZLE"] = "swamp",
        ["KNOCKBACK"] = "vomit",
        ["PHASING_ARC"] = "magic_liquid_unstable_teleportation",
        ["GRAVITY"] = "magic_liquid_faster_levitation",
        ["GRAVITY_ANTI"] = "magic_liquid_faster_levitation",
        ["QUANTUM_SPLIT"] = "creepy_liquid",
        ["RECOIL"] = "magic_liquid_movement_faster",
        ["RECOIL_DAMPER"] = "cement",
        ["SPEED"] = "magic_liquid_movement_faster",
        ["ACCELERATING_SHOT"] = "magic_liquid_movement_faster",
        ["DECELERATING_SHOT"] = "pea_soup",
        ["MATTER_EATER"] = "void_liquid",
        ["CURSE"] = "cursed_liquid"
    }

    if(ModIsEnabled("Apotheosis")) then
        local Apotheosis_Entries = {
            ["APOTHEOSIS_FIRE_CHARGE"] = "liquid_fire",
            ["APOTHEOSIS_HITFX_AFFLUENCE"] = "urine",
            ["APOTHEOSIS_KINDNESS_TO_POWER"] = "magic_liquid_charm",
            ["LIGHT"] = "apotheosis_magic_liquid_pure_light",
            ["GRAVITY_FIELD_ENEMY"] = "apotheosis_magic_liquid_infinite_flight"
        }

        for key,value in pairs(Apotheosis_Entries) do 
            table_of_elements[key] = value
        end
    end

    return table_of_elements
end

--material modification based on special interactions
if comp ~= nil then
    if storage ~= nil then
        local material_comp
        for m, n in ipairs(storage) do
            if ComponentGetValue2(n,"name") == "checked_for_material_change" then
                if ComponentGetValue2(n, "value_bool") == false then

                    local table_of_elements = get_table_of_elements() --placed here to only run once, for optimization purposes
                    local inventory = EntityGetFirstComponent( target, "Inventory2Component" )
                    local active_wand = ComponentGetValue2( inventory, "mActiveItem" )
                    local wand
                    if active_wand ~= nil then
                        wand = EZWand(active_wand)
                    end

                    if wand ~= nil then
                        local spells = wand:GetSpells()
                        local this_spells_wand_slot = 0
                        local spell_name = EntityGetName(root_id)

                        for i, spell in ipairs(spells) do
                            if (spells[i].action_id == spell_name) then
                                this_spells_wand_slot = i
                                break
                            end
                        end

                        if this_spells_wand_slot > 1 then
                            update_material = table_of_elements[spells[this_spells_wand_slot-1].action_id]
                        end
                    end

                    ComponentSetValue2(n, "value_bool", true)
                end
            end

            if ComponentGetValue2(n,"name") == "material_type" then
                material_comp = n
            end
        end

        if (material_comp ~= nil and update_material ~= nil) then
            ComponentSetValue2(material_comp, "value_string", update_material)
        end
    end
end

--projectile teleport, damage, and lifetime modification
if targets ~= nil then
    if comp ~= nil  then
        for i,v in ipairs( targets ) do
            if ( v ~= target ) and ( GameGetGameEffect( v, "CHARM" ) == 0 ) and ( EntityGetHerdRelation( target, v ) < 60 ) then
                local tx, ty = EntityGetFirstHitboxCenter( v )

                --move the projectile to be directly on top of target
                EntitySetTransform( root_id, tx, ty )
                EntityApplyTransform( root_id, tx, ty )

                if storage ~= nil then
                    for m, n in ipairs(storage) do
                        if(ComponentGetValue2(n,"name")) == "started_life_countdown" then
                            flag_comp = n
                        end
                        if(ComponentGetValue2(n,"name")) == "number_of_frames_until_death" then
                            countdown_amount = ComponentGetValue2(n,"value_int")
                        end
                    end
                end
                
                if(flag_comp ~= nil) then
                    local flag_value = ComponentGetValue2(flag_comp,"value_bool")
                    if(flag_value == false) then

                        --Set the projectile to expire
                        ComponentSetValue2(flag_comp, "value_bool", true)
                        ComponentSetValue2(comp, "lifetime", countdown_amount)

                        --I also want to modify any straight damage to respect the 4 hits/s
                        local current_damage = ComponentGetValue2(comp, "damage")
                        if(current_damage ~= nil and current_damage > 0) then
                            local new_dpf = (current_damage/30)
                            ComponentSetValue2(comp, "damage", new_dpf)
                        end
                    end
                end
                break
            end
        end
    end
end