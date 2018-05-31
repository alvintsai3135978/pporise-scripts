name = "Farm Poke$ and catch speciic Pokemon in Speciic map"
author = "Tester"
description = [[This script will catch shiny or rare Pokemon and will farm money and will also catch some speciic Pokemon in Speciic map.]]

mpaName = "Mossy Cave Fire Cavern" -- Change map name as you want.
X = 200 -- Choose a coordinate where people can't see you, choose big ammount like 150.
Y = 200 -- Choose a coordiante where people can't see you, choose big ammount like 150.
pokecenter_Name = "Route 10 Pokecenter" -- choose different pokecenter like Route 10 Pokecenter.

local catchList = 
{
  Pikachu = true,
  Electabuzz = true,
  Druddigon = true,
  Roggenrola = true,
  cleffa = true,
  Chansey = true,
  Magmar = true,
  --Add like:
  --Pokemon Name = true
  --Like I did Pikachu = true
}
local runlist = {
	Electrode = true,
	Exploud = true,
	Drifloon = true,
}

function onStart()
    log("***Starting bot***")
end

function onPathAction()
  if isPokemonUsable(1) then
     if getMapName() != mpaName then
        return teleportTo(mpaName, X, Y) --out of other player's sight :D so they can't report about us xD
     elseif getMapName() == mpaName then
     	  	log("Starting Battle..")
     	  	return startBattle() -- you can choose startSurfBattle() to start surf battle :D
     end
  else
	 if getMapName() != pokecenter_Name then
		return teleportTo(pokecenter_Name, 19, 14)
	 end
  end
end

function onBattleAction()
	if runlist[getOpponentName()] then
		return run()
	end
    if not isOpponentShiny() and not isOpponentRare() and not catchList[getOpponentName()] then
        return attack() or sendAnyPokemon()
    else
        return useItem("Ultra Ball") or useItem("Great Ball") or useItem("Poke Ball") or sendAnyPokemon()
    end
end
function onLearningMove()
	return forgetAnyMoveExcept({"Fly", "Cut", "Psychic", "Thunder"})
end