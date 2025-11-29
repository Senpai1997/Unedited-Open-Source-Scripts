local rns = game:GetService("RunService")

for _, cnx in pairs(getconnections(rns.PreRender)) do
   local src = debug.info(cnx.Function, "s")
   if src:find("Stamina") then
       cnx:Disable()
   end
end
