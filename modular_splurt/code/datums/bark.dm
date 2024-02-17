// Main code edits
/datum/bark/merp
	ignore = FALSE

/datum/bark/bark
	ignore = FALSE

/datum/bark/weh
	ignore = FALSE

// Own stuff
/datum/bark/moff/short
	name = "Moff squeak"
	id = "moffsqueak"
	soundpath = 'modular_splurt/sound/voice/barks/mothsqueak.ogg'
	allow_random = TRUE
	ignore = FALSE

/datum/bark/meow //Meow bark?
	name = "Meow"
	id = "meow"
	allow_random = TRUE
	soundpath = 'modular_citadel/sound/voice/meow1.ogg'
	minspeed = 5
	maxspeed = 11

/datum/bark/chirp
	name = "Chirp"
	id = "chirp"
	allow_random = TRUE
	soundpath = 'modular_splurt/sound/voice/chirp.ogg'

/datum/bark/caw
	name = "Caw"
	id = "caw"
	allow_random = TRUE
	soundpath = 'modular_splurt/sound/voice/caw.ogg'

/datum/bark/bleat
	name = "Bleat"
	id = "bleat"
	allow_random = TRUE
	soundpath = 'modular_splurt/sound/voice/barks/bleat_bark.ogg'
	minspeed = 5
	maxspeed = 11

//Undertale
/datum/bark/alphys
	name = "Alphys"
	id = "alphys"
	soundpath = 'modular_splurt/sound/voice/barks/undertale/voice_alphys.ogg'
	minvariance = 0

/datum/bark/asgore
	name = "Asgore"
	id = "asgore"
	soundpath = 'modular_splurt/sound/voice/barks/undertale/voice_asgore.ogg'
	minvariance = 0

/datum/bark/flowey
	name = "Flowey (normal)"
	id = "flowey1"
	soundpath = 'modular_splurt/sound/voice/barks/undertale/voice_flowey_1.ogg'
	minvariance = 0

/datum/bark/flowey/evil
	name = "Flowey (evil)"
	id = "flowey2"
	soundpath = 'modular_splurt/sound/voice/barks/undertale/voice_flowey_2.ogg'
	minvariance = 0

/datum/bark/papyrus
	name = "Papyrus"
	id = "papyrus"
	soundpath = 'modular_splurt/sound/voice/barks/undertale/voice_papyrus.ogg'
	minvariance = 0

/datum/bark/ralsei
	name = "Ralsei"
	id = "ralsei"
	soundpath = 'modular_splurt/sound/voice/barks/undertale/voice_ralsei.ogg'
	minvariance = 0

/datum/bark/sans //real
	name = "Sans"
	id = "sans"
	soundpath = 'modular_splurt/sound/voice/barks/undertale/voice_sans.ogg'
	minvariance = 0

/datum/bark/toriel
	name = "Toriel"
	id = "toriel"
	soundpath = 'modular_splurt/sound/voice/barks/undertale/voice_toriel.ogg'
	minvariance = 0
	maxpitch = BARK_DEFAULT_MAXPITCH*2 //Just because if it's high enough you get Asriel's voice

/datum/bark/undyne
	name = "Undyne"
	id = "undyne"
	soundpath = 'modular_splurt/sound/voice/barks/undertale/voice_undyne.ogg'
	minvariance = 0

/datum/bark/temmie
	name = "Temmie"
	id = "temmie"
	soundpath = 'modular_splurt/sound/voice/barks/undertale/voice_temmie.ogg'
	minvariance = 0

/datum/bark/susie
	name = "Susie"
	id = "susie"
	soundpath = 'modular_splurt/sound/voice/barks/undertale/voice_susie.ogg'
	minvariance = 0

/datum/bark/gaster
	name = "Gaster"
	id = "gaster"
	soundpath = 'modular_splurt/sound/voice/barks/undertale/voice_gaster_1.ogg'
	minvariance = 0

/datum/bark/mettaton
	name = "Mettaton"
	id = "mettaton"
	soundpath = 'modular_splurt/sound/voice/barks/undertale/voice_metta_1.ogg'
	minvariance = 0

/datum/bark/gen_monster
	name = "Generic Monster 1"
	id = "gen_monster_1"
	soundpath = 'modular_splurt/sound/voice/barks/undertale/voice_monster1.ogg'
	minvariance = 0

/datum/bark/gen_monster/alt
	name = "Generic Monster 2"
	id = "gen_monster_2"
	soundpath = 'modular_splurt/sound/voice/barks/undertale/voice_monster2.ogg'
	minvariance = 0

//Don't starve
/datum/bark/wilson
	name = "Wilson"
	id = "wilson"
	soundpath = 'modular_splurt/sound/voice/barks/dont_starve/wilson_bark.ogg'

/datum/bark/wolfgang
	name = "Wolfgang"
	id = "wolfgang"
	soundpath = 'modular_splurt/sound/voice/barks/dont_starve/wolfgang_bark.ogg'
	minspeed = 4
	maxspeed = 10

/datum/bark/woodie
	name = "Woodie"
	id = "woodie"
	soundpath = 'modular_splurt/sound/voice/barks/dont_starve/woodie_bark.ogg'
	minspeed = 4
	maxspeed = 10

/datum/bark/wurt
	name = "Wurt"
	id = "wurt"
	soundpath = 'modular_splurt/sound/voice/barks/dont_starve/wurt_bark.ogg'

/datum/bark/wx78
	name = "wx78"
	id = "wx78"
	soundpath = 'modular_splurt/sound/voice/barks/dont_starve/wx78_bark.ogg'
	minspeed = 3
	maxspeed = 9

//Goon
/datum/bark/blub
	name = "Blub"
	id = "blub"
	soundpath = 'modular_splurt/sound/voice/barks/goon/blub.ogg'

/datum/bark/bottalk
	name = "Bottalk 1"
	id = "bottalk1"
	soundpath = 'modular_splurt/sound/voice/barks/goon/bottalk_1.ogg'
	minspeed = 3
	maxspeed = 9

/datum/bark/bottalk/alt1
	name = "Bottalk 2"
	id = "bottalk2"
	soundpath = 'modular_splurt/sound/voice/barks/goon/bottalk_2.ogg'

/datum/bark/bottalk/alt2
	name = "Bottalk 3"
	id = "bottalk3"
	soundpath = 'modular_splurt/sound/voice/barks/goon/bottalk_3.ogg'

/datum/bark/bottalk/alt3
	name = "Bottalk 4"
	id = "bottalk4"
	soundpath = 'modular_splurt/sound/voice/barks/goon/bottalk_4.ogg'

/datum/bark/buwoo
	name = "Buwoo"
	id = "buwoo"
	soundpath = 'modular_splurt/sound/voice/barks/goon/buwoo.ogg'

/datum/bark/cow
	name = "Cow"
	id = "cow"
	soundpath = 'modular_splurt/sound/voice/barks/goon/cow.ogg'

/datum/bark/lizard
	name = "Lizard"
	id = "lizard"
	soundpath = 'modular_splurt/sound/voice/barks/goon/lizard.ogg'

/datum/bark/pug
	name = "Pug"
	id = "pug"
	soundpath = 'modular_splurt/sound/voice/barks/goon/pug.ogg'

/datum/bark/pugg
	name = "Pugg"
	id = "pugg"
	soundpath = 'modular_splurt/sound/voice/barks/goon/pugg.ogg'

/datum/bark/radio
	name = "Radio 1"
	id = "radio1"
	soundpath = 'modular_splurt/sound/voice/barks/goon/radio.ogg'

/datum/bark/radio/short
	name = "Radio 2"
	id = "radio2"
	soundpath = 'modular_splurt/sound/voice/barks/goon/radio2.ogg'

/datum/bark/radio/ai
	name = "Radio (AI)"
	id = "radio_ai"
	soundpath = 'modular_splurt/sound/voice/barks/goon/radio_ai.ogg'

/datum/bark/roach //Turkish characters be like
	name = "Roach"
	id = "roach"
	soundpath = 'modular_splurt/sound/voice/barks/goon/roach.ogg'

/datum/bark/skelly
	name = "Skelly"
	id = "skelly"
	soundpath = 'modular_splurt/sound/voice/barks/goon/skelly.ogg'

/datum/bark/speak
	name = "Speak 1"
	id = "speak1"
	soundpath = 'modular_splurt/sound/voice/barks/goon/speak_1.ogg'

/datum/bark/speak/alt1
	name = "Speak 2"
	id = "speak2"
	soundpath = 'modular_splurt/sound/voice/barks/goon/speak_2.ogg'

/datum/bark/speak/alt2
	name = "Speak 3"
	id = "speak3"
	soundpath = 'modular_splurt/sound/voice/barks/goon/speak_3.ogg'

/datum/bark/speak/alt3
	name = "Speak 4"
	id = "speak4"
	soundpath = 'modular_splurt/sound/voice/barks/goon/speak_4.ogg'

/datum/bark/chitter/alt
	name = "Chittery Alt"
	id = "chitter2"
	soundpath = 'modular_splurt/sound/voice/moth/mothchitter2.ogg'

// The Mayhem Special
/datum/bark/whistle
	name = "Whistle 1"
	id = "whistle1"
	soundpath = 'modular_splurt/sound/voice/barks/kazooie/birdwhistle.ogg'

/datum/bark/whistle/alt1
	name = "Whistle 2"
	id = "whistle2"
	soundpath = 'modular_splurt/sound/voice/barks/kazooie/birdwhistle2.ogg'

/datum/bark/caw/alt1
	name = "Caw 2"
	id = "caw2"
	soundpath = 'modular_splurt/sound/voice/barks/kazooie/caw.ogg'
	minspeed = 4
	maxspeed = 9

/datum/bark/caw/alt2
	name = "Caw 3"
	id = "caw3"
	soundpath = 'modular_splurt/sound/voice/barks/kazooie/caw2.ogg'
	minspeed = 3
	maxspeed = 9

/datum/bark/caw/alt3
	name = "Caw 4"
	id = "caw4"
	soundpath = 'modular_splurt/sound/voice/barks/kazooie/caw3.ogg'
	minspeed = 3
	maxspeed = 9

/datum/bark/ehh
	name = "Ehh 1"
	id = "ehh1"
	soundpath = 'modular_splurt/sound/voice/barks/kazooie/ehh.ogg'
	minspeed = 3
	maxspeed = 9

/datum/bark/ehh/alt1
	name = "Ehh 2"
	id = "ehh2"
	soundpath = 'modular_splurt/sound/voice/barks/kazooie/ehh2.ogg'

/datum/bark/ehh/alt2
	name = "Ehh 3"
	id = "ehh3"
	soundpath = 'modular_splurt/sound/voice/barks/kazooie/ehh3.ogg'

/datum/bark/ehh/alt3
	name = "Ehh 4"
	id = "ehh4"
	soundpath = 'modular_splurt/sound/voice/barks/kazooie/ehh4.ogg'
	minspeed = 3
	maxspeed = 9

/datum/bark/ehh/alt5
	name = "Ehh 5"
	id = "ehh5"
	soundpath = 'modular_splurt/sound/voice/barks/kazooie/ehh5.ogg'

/datum/bark/eugh
	name = "Eugh"
	id = "eugh"
	soundpath = 'modular_splurt/sound/voice/barks/kazooie/eugh.ogg'
	minspeed = 6
	maxspeed = 11

/datum/bark/faucet
	name = "Faucet 1"
	id = "faucet1"
	soundpath = 'modular_splurt/sound/voice/barks/kazooie/faucet.ogg'

/datum/bark/faucet/alt1
	name = "Faucet 2"
	id = "faucet2"
	soundpath = 'modular_splurt/sound/voice/barks/kazooie/faucet2.ogg'

/datum/bark/haha
	name = "Haha"
	id = "haha"
	soundpath = 'modular_splurt/sound/voice/barks/kazooie/haha.ogg'
	minspeed = 7
	maxspeed = 12

/datum/bark/ribbit
	name = "Ribbit"
	id = "ribbit"
	soundpath = 'modular_splurt/sound/voice/barks/kazooie/ribbit.ogg'

/datum/bark/hoot
	name = "Hoot"
	id = "hoot"
	soundpath = 'modular_splurt/sound/voice/barks/kazooie/hoot.ogg'
	minspeed = 4
	maxspeed = 9

/datum/bark/tweet
	name = "Tweet"
	id = "tweet"
	soundpath = 'modular_splurt/sound/voice/barks/kazooie/tweet.ogg'

/datum/bark/ahuh
	name = "Ahuh"
	id = "ahuh"
	soundpath = 'modular_splurt/sound/voice/barks/kazooie/ahuh.ogg'

/datum/bark/cry
	name = "Cry"
	id = "cry"
	soundpath = 'modular_splurt/sound/voice/barks/kazooie/cry.ogg'
	minspeed = 3
	maxspeed = 9

/datum/bark/dwoop
	name = "Dwoop"
	id = "dwoop"
	soundpath = 'modular_splurt/sound/voice/barks/kazooie/dwoop.ogg'
	minspeed = 3
	maxspeed = 9

/datum/bark/growl
	name = "Growl 1"
	id = "growl1"
	soundpath = 'modular_splurt/sound/voice/barks/kazooie/growl.ogg'
	minspeed = 3
	maxspeed = 9

/datum/bark/growl/alt1
	name = "Growl 2"
	id = "growl2"
	soundpath = 'modular_splurt/sound/voice/barks/kazooie/growl2.ogg'

/datum/bark/moan
	name = "Moan 1"
	id = "moan1"
	soundpath = 'modular_splurt/sound/voice/barks/kazooie/moan1.ogg'
	minspeed = 5
	maxspeed = 9

/datum/bark/moan/alt1
	name = "Moan 2"
	id = "moan2"
	soundpath = 'modular_splurt/sound/voice/barks/kazooie/moan2.ogg'
	minspeed = 4
	maxspeed = 9

/datum/bark/moan/alt2
	name = "Moan 3"
	id = "moan3"
	soundpath = 'modular_splurt/sound/voice/barks/kazooie/moan3.ogg'
	minspeed = 5
	maxspeed = 9

/datum/bark/raah
	name = "Raah 1"
	id = "raah1"
	soundpath = 'modular_splurt/sound/voice/barks/kazooie/raah1.ogg'
	minspeed = 6
	maxspeed = 10

/datum/bark/raah/alt1
	name = "Raah 2"
	id = "raah2"
	soundpath = 'modular_splurt/sound/voice/barks/kazooie/raah2.ogg'
	minspeed = 5
	maxspeed = 9

/datum/bark/slurp
	name = "Slurp"
	id = "slurp"
	soundpath = 'modular_splurt/sound/voice/barks/kazooie/slurp.ogg'

/datum/bark/uhm
	name = "Uhm"
	id = "uhm"
	soundpath = 'modular_splurt/sound/voice/barks/kazooie/uhm.ogg'

/datum/bark/zap
	name = "Zap"
	id = "zap"
	soundpath = 'modular_splurt/sound/voice/barks/kazooie/zap.ogg'
	minspeed = 8
	maxspeed = 12

/datum/bark/poyo
	name = "Belial"
	id = "poyo"
	soundpath = 'modular_splurt/sound/voice/barks/poyo.ogg'
	minspeed = 3
	maxspeed = 10

/datum/bark/ace_blip
	name = "Ace Talk 1"
	id = "acetalk1"
	soundpath = 'modular_splurt/sound/voice/barks/ace_attorney/aa_blip.ogg'
	allow_random = TRUE
	minspeed = 4
	minvariance = 0

/datum/bark/ace_blip/alt1
	name = "Ace Talk 2"
	id = "acetalk2"
	soundpath = 'modular_splurt/sound/voice/barks/ace_attorney/aa_dd_blip.ogg'

/datum/bark/ace_blip/alt2
	name = "Ace Talk 3"
	id = "acetalk3"
	soundpath = 'modular_splurt/sound/voice/barks/ace_attorney/aa_tgaa_blip.ogg'

/datum/bark/ace_typewriter
	name = "Ace Typewriter"
	id = "acewrite"
	soundpath = 'modular_splurt/sound/voice/barks/ace_attorney/aa_blip_typewriter.ogg'
	minspeed = 4
	minvariance = 0

/datum/bark/nomi
	name = "Nomi"
	id = "nomi"
	soundpath = 'modular_splurt/sound/voice/barks/nomi.ogg'
