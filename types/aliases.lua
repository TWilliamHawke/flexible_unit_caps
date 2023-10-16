---@alias ai_replacer string
---@alias group_unit_cap number
---@alias Units_group_data table<string, {unit_cap: integer, units_count:integer}>
---@alias Force_units_props { cap: integer, count: integer}
---@alias UnitsCache { [string] : table<string, integer> | Force_units_props }

---@alias Simple_cache table<string, {change:integer, isHidden: boolean}>
---@alias Supply_change_cache { ark_or_camp: boolean, cap_change: table<string,integer>, supply_change: Simple_cache  }
---@alias TooltipCaches {}


---@class Fluc_mct_config
---@field  a_player_effect integer
---@field a_player_unit_caps integer
---@field b_unit_caps_penalty "weak" | "harsh"
---@field f_enable_logging integer
---@field a_supply_balance_diff string
---@field b_ai_effect integer
---@field a_unit_supply string
---@field c_ai_unit_caps string
---@field b_lord_supply integer
---@field show_base_supply boolean
---@field force_english boolean

do
	---@class FlexibleUnitCapsInit
	local FlexibleUnitCapsInit = {}
	---@return Flexible_caps_api
	function FlexibleUnitCapsInit:api() end
end
