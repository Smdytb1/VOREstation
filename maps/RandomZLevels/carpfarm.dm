/area/awaymission/carpfarm
	icon_state = "blank"
	requires_power = 0
	unlimited_power = 1

/area/awaymission/carpfarm/arrival
	icon_state = "away"
	requires_power = 0
	unlimited_power = 1

/area/awaymission/carpfarm/base
	icon_state = "away"
	ambience = null // Todo: Add better ambience.

/area/awaymission/carpfarm/base/entry
	icon_state = "blue"
//	ambience = list('sound/music/TheClownChild.ogg')

// These extra areas must break up the large area, or the game crashes when machinery (like an airlock) makes sparks.
// I have no idea why. It's a nasty bug.
/area/awaymission/carpfarm/base/south_east
	icon_state = "red"

/area/awaymission/carpfarm/base/south_west
	icon_state = "bluenew"

/area/awaymission/carpfarm/base/south
	icon_state = "green"

/area/awaymission/carpfarm/base/west
	icon_state = "purple"

/area/awaymission/carpfarm/base/center
	icon_state = "yellow"

/area/awaymission/carpfarm/base/east
	icon_state = "blue"

/area/awaymission/carpfarm/base/north_east
	icon_state = "exit"

/area/awaymission/carpfarm/base/north_west
	icon_state = "orange"

/area/awaymission/carpfarm/base/north
	icon_state = "blue"

/area/awaymission/carpfarm/boss
	icon_state = "red"