/obj/structure/window
	name = "window"
	icon = 'structures.dmi'
	desc = "A window."
	density = 1
	layer = 3.2//Just above doors
	var/health = 14.0
	var/ini_dir = null
	var/state = 0
	var/reinf = 0
	anchored = 1.0
	flags = ON_BORDER

// Prefab windows to make it easy...



// Basic

/obj/structure/window/basic
	icon_state = "window"

// Reinforced

/obj/structure/window/reniforced
	reinf = 1
	icon_state = "rwindow"
	name = "reinforced window"

/obj/structure/window/reniforced/tinted
	name = "tinted window"
	icon_state = "twindow"
	opacity = 1

/obj/structure/window/reniforced/tinted/frosted
	icon_state = "fwindow"
	name = "frosted window"