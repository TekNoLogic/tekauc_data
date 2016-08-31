
local myname, ns = ...


local function Inject(frame)
	local _, link = frame:GetItem()
	local id = link and ns.ids[link]
	if not id then return end

	local min = ns.db[ns.server][id]
	if not min then return end

	local _, _, _, _, _, _, _, maxStack = GetItemInfo(id)

	local buyout = ns.GS(min)
	frame:AddDoubleLine("AH buyout:", buyout)

	if (maxStack or 0) > 1 then
		local stackbuyout = ns.GS(min*maxStack)
		frame:AddDoubleLine("AH stack buyout:", stackbuyout)
	end
end


local origs = {}
local OnTooltipSetItem = function(frame, ...)
	assert(frame, "arg 1 is nil, someone isn't hooking correctly")

	if not ns.aucloaded then Inject(frame) end
	if origs[frame] then return origs[frame](frame, ...) end
end


for i,frame in pairs{GameTooltip, ItemRefTooltip} do
	origs[frame] = frame:GetScript("OnTooltipSetItem")
	frame:SetScript("OnTooltipSetItem", OnTooltipSetItem)
end
