name = "Level Up - Power Plant"
author = "Tester"
description = [[This script will catch shiny or rare Pokemon and will Level up first Pokemon of your team in Power Plant.]]

mpaName = "Power Plant" -- Change map name as you want.
X = 42 -- Choose a coordinate where people can't see you, choose big ammount like 150.
Y = 41-- Choose a coordiante where people can't see you, choose big ammount like 150.
pokecenter_Name = "Route 10 Pokecenter" -- choose different pokecenter like Route 10 Pokecenter.

function onStart()
    log("***Starting bot***")
end

function onPathAction()
  if isPokemonUsable(1) then
    if getMapName() == pokecenter_Name then
        return teleportTo("Route 10", 26, 2) --out of other player's sight :D so they can't report about us xD
	elseif getMapName() == "Route 10" then
		return teleportTo(mpaName, X, Y)
    elseif getMapName() == mpaName then
     	if not isInBattle() then
			log("Starting Battle..")
			--                 X1	X2	Y
			return moveLinearX(42, 46, 41, "battle")
		end
     	  	--return startBattle() -- you can choose startSurfBattle() to start surf battle :D
	else
		return teleportTo(pokecenter_Name, 19, 14)
    end
  else
    return teleportTo(pokecenter_Name, 19, 14)
  end
end

function onBattleAction()
    if not isOpponentShiny() and not isOpponentRare() then
        return attack() or sendAnyPokemon() or run()
    else
        return useItem("Ultra Ball") or useItem("Great Ball") or useItem("Poke Ball") or sendAnyPokemon()
    end
end

function onLearningMove(moveName, index)
    forgetAnyMoveExcept({"Fly", "Cut", "Psychic", "Slash", "Flame Burst", "Flamethrower"})
end