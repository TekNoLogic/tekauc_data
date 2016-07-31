
local myname, ns = ...


-- Global API for any addon to query prices
local orig = GetAuctionBuyout
function GetAuctionBuyout(item)
	if not ns.aucloaded then
		local id = ns.ids[item]
		if id and tekauc_data[id] then return tekauc_data[id] end
	end
	if orig then return orig(item) end
end
