name = "Farm Poke$ in specific map by fishing"
author = "Tester"
description = [[This script will catch shiny or rare Pokemon and will farm money in specific map by fishing.]]

rod_name = "Old Rod" --Change rod name as you want.
mpaName = "Route 9" -- Change map name as you want.
X = 159 -- Choose a coordinate where people can't see you, choose big ammount like 150.
Y = 10  -- Choose a coordiante where people can't see you, choose big ammount like 150.
pokecenter_Name = "Route 10 Pokecenter" -- choose different pokecenter like Vermilion City Pokecenter.


function onStart()
    log("***Starting bot***")
end

function onPathAction()
	if isPokemonUsable(1) then
	   if getMapName() != mpaName then
	      return teleportTo(mpaName, 159, 10) --out of other othrt players sight :D so they can't report about us xD
	   elseif getMapName() == mpaName then
	        if not isFishing() then
	            log("Starting Fishing..")
	   	      	return startFishing(rod_name)
	        end
	   end
	else
		 if getMapName() != pokecenter_Name then
			return teleportTo(pokecenter_Name, 19, 14)
		 end
    end
end

function onBattleAction()
    if not isOpponentShiny() and not isOpponentRare() then
        return attack() or sendUsablePokemon() or sendAnyPokemon() or run()
    else
        return useItem("Ultra Ball") or useItem("Great Ball") or useItem("Poke Ball")
    end
end