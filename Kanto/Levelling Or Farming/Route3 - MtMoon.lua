name = "Level Up: Route 3"
author = "Tester"
description = [[This script will catch shiny or rare Pokemon and will Level up first Pokemon of your team in Route 3.]]

mpaName = "Route 3" -- Change map name as you want.
X = 112 -- Choose a coordinate where people can't see you, choose big ammount like 150.
Y = 37 -- Choose a coordiante where people can't see you, choose big ammount like 150.
pokecenter_Name = "Route 3 Pokecenter" -- choose different pokecenter like Route 10 Pokecenter.

function onStart()
    log("***Starting bot***")
end

function onPathAction()
  if isPokemonUsable(1) then
    if getMapName() == pokecenter_Name then
        return teleportTo(mpaName, X, Y) --out of other player's sight :D so they can't report about us xD
    elseif getMapName() == mpaName then
     	--                 X1	X2	Y
		return moveLinearX(112, 117, 37, "battle")
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

function onLearningMove()
	return forgetAnyMoveExcept({"Fly", "Cut", "Psychic", "Thunder", "Vine Whip"})
end