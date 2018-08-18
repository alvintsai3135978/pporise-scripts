name = "Speed EV: Diglett's Cave (near Vermilion)"
author = "Zip (Bleep)"
description = [[This script will catch shiny or rare Pokemon and will train Speed EV of your first Pokemon of your team in Diglett's Cave.]]

mpaName = "Diglett's Cave" -- Change map name as you want.
X = 77 -- Change the X value according to your map.
Y = 85 -- Change the Y value according to your map.
pokecenter_Name = "Vermilion City Pokecenter" -- choose different pokecenter like Route 10 Pokecenter.

function onStart()
   log("***Starting Speed EV Training***")
end

function onPathAction()
 if isPokemonUsable(1) then
    if getMapName() != mpaName then
       return teleportTo(mpaName, X, Y) --out of other player's sight :D so they can't report about us xD
    elseif getMapName() == mpaName then
        if not isInBattle() then
			log("Starting Battle..")
			--                 Y1	Y2	X
			return moveLinearY(85, 89, 77, "battle")
		end
              --return startBattle() -- you can choose startSurfBattle() to start surf battle :D
    end
 else
   return teleportTo(pokecenter_Name, 19, 14)
 end
end

function onBattleAction()
   if not isOpponentShiny() and not isOpponentRare() and isOpponentEffortValue("Speed") then
       return attack() or sendAnyPokemon() or run()
   else
       return useItem("Ultra Ball") or useItem("Great Ball") or useItem("Poke Ball") or sendAnyPokemon()
   end
end

function onLearningMove()
    return forgetAnyMoveExcept({"Fly", "Cut", "Psychic", "Thunder", "Vine Whip", "Confusion"})
end