#define ZERO_K 0
#define X_COLD 1
#define COLD 2
#define WARM 3
#define HOT 4

/*
ZERO_K - kills you dead almost instantly; used in abnormal circumstances, such as SCIENCE CRYSTAL effects and specific events maybe
X_COLD - kills you dead pretty fast; outside world is of that temperature at night, barring specific circumstances
COLD   - kills you dead slowly; outside world is of that temperature at day, barring specific circumstances
WARM   - default interior temperature, thanks to integrity, heating, and stuff
HOT    - kills you dead pretty fast; can be achieved by using too much heating or something
*/

area
	var/temperature = ZERO_K

	proc/CalculateTemperature() //various stuff can be added to this later, obv
		if(!master_controller)
			return

		var/temp = ZERO_K

		switch(master_controller.GetStateOfDay())
			if("day")
				temp = COLD
			if("night")
				temp = X_COLD

		//temp += weather.GetTemperatureAdjustment() -- Just a mockup for now

		if(CheckIntegrity())
			temp = max(GetHeating(), temp)

		temperature = temp

		return

	proc/CheckIntegrity()

		for(var/turf/simulated/floor/tile in src)
			var/totalSnowDir = 0 //first, we check if it's adjacent to any snow tile

			for(var/turf/simulated/snow/snow in range(1,tile))
				var/snowDir = get_dir(tile,snow)
				if(snowDir in cardinal) //to simplify stuff, only snow in cardinal directions counts. No seeping through diagonals for ya.
					totalSnowDir |= snowDir

			if(!totalSnowDir) //if the floor tile is internal, all's ok
				continue

			for(var/obj/structure/window/window in tile) //otherwise, however, we'll have to check for windows
				totalSnowDir &= ~window.dir //if there's a window in that direction, it preserves integrity
				//I realise that that results in some exceptions that should, logically, protect but they don't in-game, but eh,
				//I can improve the algorithm later

			if(!totalSnowDir) //if it's protected on all sides, all's fine
				continue

			return 0 //otherwise, fuck, integrity's broken

		return 1 //if EVERY tile has its integrity perserved, all's well and integrity of the whole area is preserved

	proc/GetHeating()
		var/heating = ZERO_K

		for(var/turf/simulated/floor/tile in src)
			for(var/mob/living/carbon/monkey/monkey in tile)
				heating = (heating == ZERO_K) ? WARM : HOT
		//y u remove heaters pete they'd be perfect for testing instead we'll have to BURN ANIMALS IS THAT WHAT YOU WANT

		return heating