name = "Do mining in specific map"
author = "Tester"
description = [[This script will mine in specific map.]]

axe_name = "Super Pickaxe" --Change rod name as you want.
mpaName = "Spear Pillar" -- Change map name as you want.
X = 399 -- Choose a coordinate where people can't see you, choose big ammount like 150.
Y = 300  -- Choose a coordiante where people can't see you, choose big ammount like 150.
pokecenter_Name = "Route 3 Pokecenter" -- choose different pokecenter like Vermilion City Pokecenter.


function onStart()
    log("***Starting bot***")
end

function onPathAction()
	if isPokemonUsable(1) then
	   if getMapName() != mpaName then
	      return teleportTo(mpaName, X, Y) --out of other othrt players sight :D so they can't report about us xD
	   elseif getMapName() == mpaName then
	        if not isMining() then
	            log("Starting Mining..")
	   	      	return startColoredRockMining(axe_name, "Pale", "Prism") --You can also use startColoredRockMining(axe_name, "Color") put your desire color like Red, Blue, Green etc.
	        end
	   end
	else
		return teleportTo(pokecenter_Name, 19, 19) --To heal Pokemon choose any pokecenter but choose valid one.
	end
end

function onBattleAction()
    if not isOpponentShiny() and not isOpponentRare() then
        return attack() or sendUsablePokemon() or sendAnyPokemon() or run()
    else
        return useItem("Ultra Ball") or useItem("Great Ball") or useItem("Poke Ball")
    end
end