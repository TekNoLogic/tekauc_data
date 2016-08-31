
local myname, ns = ...


-- Global API for any addon to query prices
local orig = GetAuctionBuyout
function GetAuctionBuyout(item)
	if not ns.aucloaded then
		local id = ns.ids[item]
		if id and ns.db[ns.server][id] then return ns.db[ns.server][id] end
	end
	if orig then return orig(item) end
end



tekauc_data = {}


-- API for tekauc to get our price table
function tekauc_data.GetTable()
	return ns.db[ns.server]
end


-- API for tekauc to erase our price table
function tekauc_data.SetTable(t)
	ns.db[ns.server] = t
end
