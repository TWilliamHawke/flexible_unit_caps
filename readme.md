API documentation
---
First of all, you need to subscribe on __FlexibleUnitCapsInit__ event. This works almost the same as Mod Configuration Tool.


```lua
core:add_listener(
  "Your_Listener_Name",
  "FlexibleUnitCapsInit",
  true,
  function(context)
    local flexible_unit_caps = context:api();

    --Paste your code here

  
  end,
  true
)

```


---
__flexible_unit_caps:log(text)__
Add new string into "supply_lines_rework_log.txt" file

__Parameters:__
__text:__ any string 

__Example:__
```lua
flexible_unit_caps:log("Hello World")
```
---
__flexible_unit_caps:add_unit_group(group_key, unit_cap, ai_replacer, ...parent_groups)__
Add params for new unit group

__Parameters:__
__group_key:__ your id for new unit group. Should have a localisation
__unit_cap:__ defines how much units of this group can recruit a player wothout penalty. Recommended values: from 4 to 10
__ai_replacer:__ id for the unit from main_units_table that will be used to replace units from this group if AI recruits them over the limit
__parent_groups:__ zero or more additional arguments to define the unit group(s) that will include this unit group


__Example:__
```lua
--units in group "my_emp_nuln_ironsides" will have unit cap 4, units over it in ai armies will be replace by handgunners it will be a part of "fluc_all_long_range" unit group 
flexible_unit_caps:add_unit_group("my_emp_nuln_ironsides", 4, "wh_main_emp_inf_handgunners", "fluc_all_long_range")
```
---
__flexible_unit_caps:set_unit_data(unit_key, supply_points, unit_group)__
Add support for new unit. Without this unit will be marked as unknown. Also allows to change values for units which already included in the mod's database

__Parameters:__
__unit_key:__ unit id from main_units_table
__supply_points:__ defines how much supply points will consume this unit. Depends on unit quality. Recommended values: from 0 (militia) to 4 (dragon)
__unit_group:__ unit group that will be used for unit cap. You can find already existing groups in src/db/units_group_caps.lua or create your own group (don't forget to add localisation)

__Example:__
```lua
--Carroburg Swordsmen will consume 3 supply points and will belong to greatswords group
flexible_unit_caps:set_unit_data("emp_inf_carroburg_greatswords", 3, "srw_emp_greatswords")
```
---
__flexible_unit_caps:add_unit_group_discount(lord_key, unit_group, value)__
Changes supply cost unit cap for selected units group in this lord's army. Doesn't require any lord skills

__Parameters:__
__lord_key:__ lord id from agent_subtypes_tables
__unit_group:__ use a group from mod localisation folder (text/db/supply_lines_units_groups.loc) or your own group
__value:__ how much supply cost for units in this group will change in this lord's army. Negative value - less points, positive value - more points

__Example:__
```lua
--all stegadons in Kroq Gar army will consume 1 supply points less
flexible_unit_caps:add_unit_group_discount("wh2_main_lzd_kroq_gar", "srw_lzd_stegadons", -1)
--all saurus in Tehenhauin army will consume 2 additional supply points per unit
flexible_unit_caps:add_unit_group_discount("wh2_dlc12_lzd_tehenhauin", "srw_lzd_saurus", 2)
```

---
__flexible_unit_caps:add_lord_skill_discount(lord_key, unit_group, value, lord_skill_key)__
Changes supply cost and unit cap for selected units group in this lord's army if lord has special skill

__Parameters:__
__lord_key:__ lord id from agent_subtypes_tables
__unit_group:__ use a group from mod localisation folder (text/db/supply_lines_units_groups.loc) or your own group
__value:__ how much supply cost for units in this group will change in this lord's army. Negative value - less points, positive value - more points
__lord_skill_key:__ lord's skill id from character_skills_tables

---

__flexible_unit_caps:set_military_building_level(building_key, settlement_level)__
Use this if your mod add new military building (red or blue)

__Parameters:__
__building_key:__ building id from building_levels_tables
__settlement_level:__ level of settlement which is required for this building

---
__flexible_unit_caps:add_garrison_building(building_key)__
Use this if your mod add special walls/garrison building

__Parameters:__
__building_key:__ building id from building_levels_tables

---
__Final Example how your script file can look:__

```lua
core:add_listener(
  "Your_Listener_Name",
  "FlexibleUnitCapsInit",
  true,
  function(context)
    local fluc = context:api();

    --create the unit group for nuln ironsides
    fluc:add_unit_group("my_nuln_ironsides", 4, "wh_main_emp_inf_handgunners", "fluc_all_long_range")
    --add normal and ror ironsides to mod database
    fluc:set_unit_data("my_emp_inf_nuln_ironsides", 3, "my_nuln_ironsides")
    fluc:set_unit_data("my_emp_inf_nuln_ironsides_ror", 3, "my_nuln_ironsides")
    --make ironsides cheaper for Balthasar Gelt with his unique skill
    fluc:add_lord_skill_discount("wh_main_emp_balthasar_gelt", "my_nuln_ironsides", -1, "wh_dlc08_skill_emp_lord_unique_balthasar_unique_2"),
    --make ironsides cheaper for Aldebrand Ludenhof from mixu mod
    fluc:add_unit_group_discount("emp_aldebrand_ludenhof", "my_nuln_ironsides", -2),
    --ironsides armory can be constructed on city level 4
    fluc:set_military_building_level("my_emp_ironsides_armory_1", 4)

  end,
  true
)
```
