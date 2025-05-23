//Defines for atom layers and planes
//KEEP THESE IN A NICE ACSCENDING ORDER, PLEASE

#define PLANE_VOID -100

#define CLICKCATCHER_PLANE -99

#define PLANE_SPACE -98
#define PLANE_SPACE_RENDER_TARGET "PLANE_SPACE"

#define PLANE_SPACE_PARALLAX -95
#define PLANE_SPACE_PARALLAX_RENDER_TARGET "PLANE_SPACE_PARALLAX"

#define OPENSPACE_LAYER 17 //Openspace layer over all
#define OPENSPACE_PLANE -10 //Openspace plane below all turfs
#define OPENSPACE_BACKDROP_PLANE -9 //Black square just over openspace plane to guaranteed cover all in openspace turf

#define FLOOR_PLANE -8
#define FLOOR_PLANE_RENDER_TARGET "FLOOR_PLANE"

#define WALL_PLANE -7
#define WALL_PLANE_RENDER_TARGET "WALL_PLANE"

#define ABOVE_WALL_PLANE -6
#define ABOVE_WALL_PLANE_RENDER_TARGET "ABOVE_WALL_PLANE"

#define FIELD_OF_VISION_BLOCKER_PLANE -5
#define FIELD_OF_VISION_BLOCKER_RENDER_TARGET "*FIELD_OF_VISION_BLOCKER_PLANE"

#define FIELD_OF_VISION_PLANE -4
#define FIELD_OF_VISION_RENDER_TARGET "*FIELD_OF_VISION_PLANE"
#define FIELD_OF_VISION_LAYER 17 //used to place the visual (not the mask) shadow cone above any other floor plane stuff.

#define GAME_PLANE -3
#define GAME_PLANE_RENDER_TARGET "GAME_PLANE"

#define FIELD_OF_VISION_VISUAL_PLANE -2 //Yea, FoV does require quite a few planes to work with 513 filters to a decent degree.
#define FIELD_OF_VISION_VISUAL_RENDER_TARGET "FIELD_OF_VISION_VISUAL_PLANE"

#define CHAT_PLANE -1 //We don't want heard messages to be hidden by FoV.

#define CHAT_LAYER 12.0001 // Do not insert layers between these two values
#define CHAT_LAYER_MAX 12.9999

#define BLACKNESS_PLANE 0 //To keep from conflicts with SEE_BLACKNESS internals
#define BLACKNESS_PLANE_RENDER_TARGET "BLACKNESS_PLANE"

///Layers most often used by atoms of plane lower than GAME_PLANE
#define SPACE_LAYER 1.8
//#define TURF_LAYER 2 //For easy recordkeeping; this is a byond define
#define MID_TURF_LAYER 2.02
#define HIGH_TURF_LAYER 2.03
#define TURF_PLATING_DECAL_LAYER 2.031
#define TURF_DECAL_LAYER 2.039 //Makes turf decals appear in DM how they will look inworld.
#define ABOVE_OPEN_TURF_LAYER 2.04
#define CLOSED_TURF_LAYER 2.05
#define BULLET_HOLE_LAYER 2.06
#define ABOVE_NORMAL_TURF_LAYER 2.08
#define LATTICE_LAYER 2.2
#define DISPOSAL_PIPE_LAYER 2.3
#define GAS_PIPE_HIDDEN_LAYER 2.35
#define WIRE_LAYER 2.4
#define WIRE_TERMINAL_LAYER 2.45
#define GAS_SCRUBBER_LAYER 2.46
#define GAS_PIPE_VISIBLE_LAYER 2.47
#define GAS_FILTER_LAYER 2.48
#define GAS_PUMP_LAYER 2.49
#define LOW_OBJ_LAYER 2.5
///catwalk overlay of /turf/open/floor/plating/plating_catwalk
#define CATWALK_LAYER 2.51
#define LOW_SIGIL_LAYER 2.52
#define SIGIL_LAYER 2.54
#define HIGH_SIGIL_LAYER 2.56
///Layers most often used by atoms of plane equal or higher than GAME_PLANE
#define BELOW_OPEN_DOOR_LAYER 2.6
#define BLASTDOOR_LAYER 2.65
#define OPEN_DOOR_LAYER 2.7
#define DOOR_HELPER_LAYER 2.71 //keep this above OPEN_DOOR_LAYER
#define PROJECTILE_HIT_THRESHHOLD_LAYER 2.75 //projectiles won't hit objects at or below this layer if possible
#define TABLE_LAYER 2.8
#define TRAY_LAYER 2.85
#define GATEWAY_UNDERLAY_LAYER 2.85
#define BELOW_OBJ_LAYER 2.9
#define LOW_ITEM_LAYER 2.95
//#define OBJ_LAYER 3 //For easy recordkeeping; this is a byond define
#define CLOSED_BLASTDOOR_LAYER 3.05
#define CLOSED_DOOR_LAYER 3.1
#define CLOSED_FIREDOOR_LAYER 3.11
#define SHUTTER_LAYER 3.12 // HERE BE DRAGONS
#define ABOVE_OBJ_LAYER 3.2
#define ABOVE_WINDOW_LAYER 3.3
#define SIGN_LAYER 3.4
#define NOT_HIGH_OBJ_LAYER 3.5
#define HIGH_OBJ_LAYER 3.6

#define BELOW_MOB_LAYER 3.7
#define LYING_MOB_LAYER 3.8
#define MOB_LOWER_LAYER 3.95
//#define MOB_LAYER 4 //For easy recordkeeping; this is a byond define
#define MOB_UPPER_LAYER 4.05
#define ABOVE_MOB_LAYER 4.1
#define WALL_OBJ_LAYER 4.25
#define EDGED_TURF_LAYER 4.3
#define ON_EDGED_TURF_LAYER 4.35
#define LARGE_MOB_LAYER 4.4
#define ABOVE_ALL_MOB_LAYER 4.5

#define SPACEVINE_LAYER 4.8
#define SPACEVINE_MOB_LAYER 4.9
//#define FLY_LAYER 5 //For easy recordkeeping; this is a byond define
#define ABOVE_FLY_LAYER 5.1
#define GASFIRE_LAYER 5.2
#define RIPPLE_LAYER 5.3

#define GHOST_LAYER 6
#define LOW_LANDMARK_LAYER 9
#define MID_LANDMARK_LAYER 9.1
#define HIGH_LANDMARK_LAYER 9.2
#define AREA_LAYER 10
#define MASSIVE_OBJ_LAYER 11
#define POINT_LAYER 12

#define EMISSIVE_BLOCKER_PLANE 12
#define EMISSIVE_BLOCKER_LAYER 12
#define EMISSIVE_BLOCKER_RENDER_TARGET "*EMISSIVE_BLOCKER_PLANE"

#define EMISSIVE_PLANE 13
#define EMISSIVE_LAYER 13

#define EMISSIVE_UNBLOCKABLE_PLANE 14
#define EMISSIVE_UNBLOCKABLE_LAYER 14
#define EMISSIVE_LAYER_UNBLOCKABLE 14
#define EMISSIVE_UNBLOCKABLE_RENDER_TARGET "*EMISSIVE_UNBLOCKABLE_PLANE"
#define EMISSIVE_RENDER_TARGET "*EMISSIVE_PLANE"

#define LIGHTING_PLANE 15
#define LIGHTING_LAYER 15
#define LIGHTING_RENDER_TARGET "LIGHT_PLANE"

#define O_LIGHTING_VISUAL_PLANE 110
#define O_LIGHTING_VISUAL_RENDER_TARGET "O_LIGHT_VISUAL_PLANE"

#define RAD_TEXT_LAYER 15.1

#define ABOVE_LIGHTING_PLANE 16
#define ABOVE_LIGHTING_LAYER 16
#define ABOVE_LIGHTING_RENDER_TARGET "ABOVE_LIGHTING_PLANE"

#define BYOND_LIGHTING_PLANE 18
#define BYOND_LIGHTING_LAYER 18
#define BYOND_LIGHTING_RENDER_TARGET "BYOND_LIGHTING_PLANE"

#define CAMERA_STATIC_PLANE 19
#define CAMERA_STATIC_LAYER 19
#define CAMERA_STATIC_RENDER_TARGET "CAMERA_STATIC_PLANE"

/// Plane for balloon text (text that fades up)
/// It's over lighting and every other crap because this is nearly as important as hud content and only visible to the user.
#define BALLOON_CHAT_PLANE 20

//HUD layer defines

#define FULLSCREEN_PLANE 20
#define FLASH_LAYER 20
#define FULLSCREEN_LAYER 20.1
#define UI_DAMAGE_LAYER 20.2
#define BLIND_LAYER 20.3
#define CRIT_LAYER 20.4
#define CURSE_LAYER 20.5
#define FULLSCREEN_RENDER_TARGET "FULLSCREEN_PLANE"

#define HUD_PLANE 21
#define HUD_LAYER 21
#define HUD_RENDER_TARGET "HUD_PLANE"

#define VOLUMETRIC_STORAGE_BOX_PLANE 22
#define VOLUMETRIC_STORAGE_BOX_LAYER 22
#define VOLUMETRIC_STORAGE_BOX_RENDER_TARGET "VOLUME_STORAGE_BOX_PLANE"

#define VOLUMETRIC_STORAGE_ITEM_PLANE 23
#define VOLUMETRIC_STORAGE_ITEM_LAYER 23
#define VOLUMETRIC_STORAGE_ACTIVE_ITEM_LAYER 25
#define VOLUMETRIC_STORAGE_ACTIVE_ITEM_PLANE 25
#define VOLUMETRIC_STORAGE_ITEM_RENDER_TARGET "VOLUME_STORAGE_ITEM_PLANE"

#define ABOVE_HUD_PLANE 30
#define ABOVE_HUD_LAYER 30
#define ABOVE_HUD_RENDER_TARGET "ABOVE_HUD_PLANE"

///Layer for lobby menu collapse button
#define LOBBY_BELOW_MENU_LAYER 2
///Layer for lobby menu background image and main buttons (Join/Ready, Observe, Charater Prefs)
#define LOBBY_MENU_LAYER 3
///Layer for lobby menu shutter, which covers up the menu to collapse/expand it
#define LOBBY_SHUTTER_LAYER 4
///Layer for lobby menu buttons that are hanging away from and lower than the main panel
#define LOBBY_BOTTOM_BUTTON_LAYER 5

#define SPLASHSCREEN_LAYER 90
#define SPLASHSCREEN_PLANE 90
#define SPLASHSCREEN_RENDER_TARGET "SPLASHSCREEN_PLANE"

// Admin popup layer
#define ADMIN_POPUP_LAYER 1

///Plane master controller keys
#define PLANE_MASTERS_GAME "plane_masters_game"

///Layer for screentips
#define SCREENTIP_LAYER 40
