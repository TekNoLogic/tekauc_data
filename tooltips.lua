
local myname, ns = ...


local function Inject(frame)
	local _, link = frame:GetItem()
	local id = link and ns.ids[link]
	if id then
		local min = tekauc_data[id]
		local _, _, _, _, _, _, _, maxStack = GetItemInfo(id)

		if min then
			local buyout = ns.GS(min)
			frame:AddDoubleLine("AH buyout:", buyout)

			if (maxStack or 0) > 1 then
				local stackbuyout = ns.GS(min*maxStack)
				frame:AddDoubleLine("AH stack buyout:", stackbuyout)
			end
		end
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
