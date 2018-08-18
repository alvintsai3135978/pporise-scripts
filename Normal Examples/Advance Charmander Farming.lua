name = "Advance Pokemon Farming."
author = "Tester"
description = [[This script will catch shiny or rare Pokemon and will catch some speciic Pokemon with desired natures and ivs in Speciic map.]]

mpaName = "Hellfire Cavern F2" -- Change map name as you want.
X = 260 -- Choose a coordinate where people can't see you, choose big amount like 150.
Y = 260 -- Choose a coordinate where people can't see you, choose big amount like 150.
pokecenter_Name = "Cherrygrove City Pokecenter" -- choose different pokecenter like Route 10 Pokecenter.
weak_move = "Leer" -- Change the move name with your first pokemon's weakest move.
desiredNature = "Timid" -- Change your desired nature from here if you want only one Pokemon with desired nature.
desired_ivs = "Speed" -- Change to your desired Stat name here which you want to get the Individual Value(IV).

local catchList = 
{
  Pikachu = true,
  Electabuzz = true,
  Charmander = true,
  --Add like:
  --Pokemon Name = true
  --Like I did Pikachu = true
}
--To catch multiple Pokemon with desired nature.
local desiredNatuers = 
{
  Timid = true,
  --Add like:
  --Nature Name = true
  --Like I did Jolly = true
}

function onStart()
    log("***Starting bot***")
end

function onPathAction()
  if isPokemonUsable(1) and isPokemonUsable(2) then
     if getMapName() != mpaName then
        return teleportTo(mpaName, X, Y) --out of other player's sight :D so they can't report about us xD
     elseif getMapName() == mpaName then
          log("Starting Battle..")
          return startBattle() -- you can choose startSurfBattle() to start surf battle :D
     end
  else
    return teleportTo(pokecenter_Name, 19, 14)
  end
end

function onBattleAction()
    if (isOpponentShiny() or isOpponentRare()) and getOpponentName() != "Charmander" then
      return useItem("Ultra Ball") or useItem("Great Ball") or useItem("Poke Ball") or sendAnyPokemon()
    end

    if catchList[getOpponentName()] then
       return PerFormActionsToGetOpponentIVS()
    end
    
    return attack() or run() or sendAnyPokemon()
end

function PerFormActionsToGetOpponentIVS()
  if isOppenentDataReceived() then --isOppenentDataReceived() to check if we got the full data of our opponent.
    if (getOpponenetNature() == desiredNature or desiredNatuers[getOpponenetNature()]) and getOpponenetAbility() == "Solar Power" then --getOpponenetNature() is used to get opponent Nature.
      if getOpponentIV("Speed") >= 20 and getOpponentIV("SPATK") >= 20 then --getOpponentIV("Stat_Name") to get our desired IV :D
      	if getActivePokemonNumber() != 2 then
      		return sendPokemon(2) or sendAnyPokemon()
      	elseif getActivePokemonNumber() == 2 and getOpponentHealth() != 1 then
      		return weakAttack() or sendAnyPokemon() or run()
      	end
        return useItem("Ultra Ball") or useItem("Great Ball") or useItem("Poke Ball") or sendAnyPokemon()
      end
    end
	return run() or sendAnyPokemon() or attack()
  else
    return useMove(weak_move) or weakAttack() or run() or sendAnyPokemon()
  end
end