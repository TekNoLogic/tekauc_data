
local myname, ns = ...


ns.dbname = "tekauc_dataDB"
function ns.OnLoad()
	ns.server = GetRealmName()
	ns.db[ns.server] = ns.db[ns.server] or {}
end


function ns.ADDON_LOADED(event, addon)
	if addon:lower() ~= "tekauc" then return end

	ns.aucloaded = true

	ns.UnregisterEvent("ADDON_LOADED")
	ns.ADDON_LOADED = nil
end
ns.RegisterEvent("ADDON_LOADED")
