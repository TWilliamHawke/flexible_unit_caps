---@diagnostic disable: missing-parameter, undefined-field
---@param supply_balance integer
function Flexible_unit_caps:create_balance_counter(supply_balance)
  if not self.enable_supply_balance then return end

  local resource_bar = find_uicomponent(core:get_ui_root(), "hud_campaign", "resources_bar");
  if not resource_bar then return end

  local money_holder = find_uicomponent(resource_bar,"treasury_holder_standard") or find_uicomponent(resource_bar,"treasury_holder")

  if not money_holder then return end

  local component = find_uicomponent(money_holder, "fluc_balance");

  if not component then
    local text = find_uicomponent(money_holder, "dy_income")
    component = UIComponent(text:CopyComponent("fluc_balance"))
    local icon = UIComponent(component:Find(0))
    if icon then
      icon:SetImagePath("ui/skins/fluc_icon_supplies.png", 0)
    end
  end

  local state = supply_balance < 0 and "negative" or "positive";

  component:SetVisible(true)
  component:SetText(supply_balance)
  component:SetState(state)

end