name = "Advance Pokemon Farming."
author = "Tester"
description = [[This script will catch shiny or rare Pokemon and will catch some speciic Pokemon with desired natures and ivs in Speciic map.]]

mpaName = "Power Plant" -- Change map name as you want.
X = 100 -- Choose a coordinate where people can't see you, choose big ammount like 150.
Y = 16 -- Choose a coordiante where people can't see you, choose big ammount like 150.
pokecenter_Name = "Route 10 Pokecenter" -- choose different pokecenter like Route 10 Pokecenter.
weak_move = "Splash" -- 
desiredNature = "Jolly" -- Change your desired nature from here if you want only one Pokemon with desired nature.
desired_ivs = "Speed" -- Chage to your desired Stat name here which you want to get the iffort value(iv).

local catchList = 
{
  Pikachu = true,
  Electabuzz = true,
  Diglett = true,
  --Add like:
  --Pokemon Name = true
  --Like I did Pikachu = true
}
--To catch multiple Pokemon with desired nature.
local desiredNatuers = 
{
  Jolly = true,
  --Add like:
  --Nature Name = true
  --Like I did Jolly = true
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
    return teleportTo(pokecenter_Name, 19, 14)
  end
end

function onBattleAction()
    if isOpponentShiny() or isOpponentRare() then
      return useItem("Ultra Ball") or useItem("Great Ball") or useItem("Poke Ball") or sendAnyPokemon()
    end

    if catchList[getOpponentName()] then
      return PerFormActionsToGetOpponentIVS()
    end
    
    return run() or sendAnyPokemon()
end

function PerFormActionsToGetOpponentIVS()
  if isOppenentDataReceived() then --isOppenentDataReceived() to check if we got the full data of our opponent.
    if getOpponenetNature() == desiredNature or desiredNatuers[getOpponenetNature()] then --getOpponenetNature() is used to get opponent Nature.
      if getOpponentIV("Speed") >= 31 then --getOpponentIV("Stat_Name") to get our desired IV :D
        return useItem("Ultra Ball") or useItem("Great Ball") or useItem("Poke Ball") or sendAnyPokemon()
      end
    end
  else
    return useMove(weak_move) or weakAttack() or run() or sendAnyPokemon()
  end
end