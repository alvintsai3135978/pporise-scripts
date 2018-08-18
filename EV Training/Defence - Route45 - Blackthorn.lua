name = "Defence EV: Route 45 (near Blackthorn)"
author = "Tester"
description = [[This script will catch shiny or rare Pokemon and will train Defence EV of your first Pokemon of your team in Route 45.]]

mpaName = "Route 45" -- Change map name as you want.
X = 16 -- Choose a coordinate where people can't see you, choose big ammount like 150.
Y = 10 -- Choose a coordiante where people can't see you, choose big ammount like 150.
pokecenter_Name = "Blackthorn City Pokecenter" -- choose different pokecenter like Route 10 Pokecenter.

function onStart()
    log("***Starting Defence EV Training***")
end

function onPathAction()
  if isPokemonUsable(1) then
     if getMapName() != mpaName then
        return teleportTo(mpaName, X, Y) --out of other player's sight :D so they can't report about us xD
     elseif getMapName() == mpaName then
     	if not isInBattle() then
			log("Starting Battle..")
			--                 X1	X2	Y
			return moveLinearX(16, 20, 10, "battle") -- Change "battle" to "surf battle" if you want start surf battle but I will not suggest you to do that.
		end
     	  	--return startBattle() -- you can choose startSurfBattle() to start surf battle :D
     end
  else
     if getMapName() != pokecenter_Name then
	    return teleportTo(pokecenter_Name, 19, 14)
	 end
  end
end

function onBattleAction()
    if not isOpponentShiny() and not isOpponentRare() and isOpponentEffortValue("DEF") then
        return attack() or sendAnyPokemon() or run()
    else
        return useItem("Ultra Ball") or useItem("Great Ball") or useItem("Poke Ball") or sendAnyPokemon()
    end
end