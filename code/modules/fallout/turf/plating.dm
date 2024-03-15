//Fallout 13 floor plating directory

/turf/open/floor/plating/wooden
	name = "house base"
	icon_state = "housebase"
	icon = 'icons/fallout/turfs/ground.dmi'
	intact = 0
	broken_states = list("housebase1-broken", "housebase2-broken", "housebase3-broken", "housebase4-broken")
	burnt_states = list("housebase")
//	step_sounds = list("human" = "woodfootsteps")

/turf/open/floor/plating/wooden/make_plating()
	return src

/turf/open/floor/plating/tunnel
	name = "metal floor"
	icon_state = "tunneldirty"
	icon = 'icons/fallout/turfs/ground.dmi'
	baseturfs = /turf/open/indestructible/ground/inside/mountain

/turf/open/floor/plating/f13/outside/roof
	name = "rooftop"
	desc = "A rooftop."
	icon = 'icons/turf/rooftop.dmi'
	icon_state = "brick_1"

/turf/open/floor/plating/f13/outside/roof/red
	icon_state = "brick_r"

/turf/open/floor/plating/f13/outside/roof/blue
	icon_state = "brick_b"

/turf/open/floor/plating/f13/outside/roof/metal
	name = "metal roof"
	icon_state = "rust_1"

/turf/open/floor/plating/f13/outside/roof/metal/verdigris
	icon_state = "rust_c"

/turf/open/floor/plating/f13/outside/roof/metal/corrugated
	icon_state = "shingles_1"

/turf/open/floor/plating/f13/outside/roof/metal/corrugated/red
	icon_state = "shingles_r"

/turf/open/floor/plating/f13/outside/roof/metal/corrugated/green
	icon_state = "shingles_g"

/turf/open/floor/plating/f13/outside/roof/wood
	name = "wooden roof"
	icon_state = "wood_1"

/turf/open/floor/plating/f13/outside/roof/wood/old
	icon_state = "wood_2"
