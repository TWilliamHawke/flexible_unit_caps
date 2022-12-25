--version from hunter & beast patch
function Flexible_unit_caps:faction_is_horde(faction)
	return faction:is_allowed_to_capture_territory() == false;
end;
