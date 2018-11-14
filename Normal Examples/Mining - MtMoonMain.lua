name = "Do mining in specific map"
author = "Tester"
description = [[This script will mine in specific map.]]

axe_name = "Old Pickaxe" --Change rod name as you want.
mpaName = "Mt Moon Main" -- Change map name as you want.
X = 259 -- Choose a coordinate where people can't see you, choose big ammount like 150.
Y = 200  -- Choose a coordiante where people can't see you, choose big ammount like 150.
pokecenter_Name = "Route 3 Pokecenter" -- choose different pokecenter like Vermilion City Pokecenter.


function onStart()
    log("***Starting bot***")
end

function onPathAction()
	if isPokemonUsable(1) then
	   if getMapName() != mpaName then
	      return teleportTo(mpaName, 159, 10) --out of other othrt players sight :D so they can't report about us xD
	   elseif getMapName() == mpaName then
	        if not isMining() then
	            log("Starting Mining..")
	   	      	return startColoredRockMining(axe_name, true, "Red") --startAnyColorRockMining(axe_name) --You can also use startColoredRockMining(axe_name, "Color") put your desire color like Red, Blue, Green etc.
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