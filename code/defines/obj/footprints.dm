/obj/effect/footprint
	name = "footprints"
	icon = 'snow.dmi'
	layer = 2

/obj/effect/footprint/New()
	spawn(500)
		del(src)
//this really needs to be replaced with a fancy wind system.

/obj/effect/footprint/human
	desc = "Human footprints."
	icon_state = "footprints_human"