function GetPartyMemberZone(playerName)
	local unitID
	for i = 1, 4 do
		local tmpUnitID = 'party'..i
		local unitName = UnitName(tmpUnitID)
		if unitName == playerName then
			unitID = tmpUnitID
		end
	end

	if unitID == nil then
		return nil
	end

	local mapID = C_Map.GetBestMapForUnit(unitID);

	if mapID == nil then
		return nil
	end

	return GetZone(mapID)
end

function GetZone(mapID)
	local map = C_Map.GetMapInfo(mapID);

	if map.mapType > 3 then
		return GetZone(map.parentMapID)
	end
	return map.name
end
