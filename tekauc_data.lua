
local myname, ns = ...


tekauc_data = tekauc_data or {}


function ns.ADDON_LOADED(event, addon)
	if addon:lower() ~= "tekauc" then return end

	ns.aucloaded = true

	ns.UnregisterEvent("ADDON_LOADED")
	ns.ADDON_LOADED = nil
end
ns.RegisterEvent("ADDON_LOADED")
