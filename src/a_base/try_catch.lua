function Flexible_unit_caps:try_catch(callback)
  local ok, err = pcall(callback);

  if not ok then
    self:logCore(err);
  end

end;