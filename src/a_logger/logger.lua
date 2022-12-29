function Flexible_unit_caps:logCore(text)
  local logText = tostring(text);
  local logFile = io.open("flexible_unit_caps_log.txt","a");
  if(logFile == nil) then return end;

  logFile:write("FLUC: "..logText .. "  \n");
  logFile:flush();
  logFile:close();
end

function Flexible_unit_caps:log(text)
  if self.log_level < 1 then return end;
  self:logCore(text);
end

function Flexible_unit_caps:logAI(text)
  if self.log_level < 2 then return end;
  self:logCore(text);
end

function Flexible_unit_caps:logDebug(text)
  if self.log_level < 3 then return end;
  self:logCore(text);
end

function Flexible_unit_caps:create_new_log()
  local logTimeStamp = os.date("%d, %m %Y %X");

  local logFile = io.open("flexible_unit_caps_log.txt","w+");
  if(logFile == nil) then return end;

  logFile:write("NEW LOG ["..logTimeStamp.."] \n");
  logFile:flush();
  logFile:close();
end

