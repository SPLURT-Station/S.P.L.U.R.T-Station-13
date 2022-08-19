//#define LOWMEMORYMODE //uncomment this to load centcom and runtime station and thats it.

#include "map_files\generic\CentCom.dmm"

#ifndef LOWMEMORYMODE
	#ifdef ALL_MAPS
		#include "map_files\Mining\Lavaland.dmm"
		#include "map_files\debug\runtimestation.dmm"
		#include "map_files\Deltastation\DeltaStation2.dmm"
		#include "map_files\MetaStation\MetaStation.dmm"
		#include "map_files\OmegaStation\OmegaStation.dmm"
		#include "map_files\PubbyStation\PubbyStation.dmm"
		#include "map_files\BoxStation\BoxStation.dmm"
		#include "map_files\LambdaStation\lambda.dmm"
		#include "map_files\SpookyStation\SpookyStation.dmm"
		#include "map_files\CogStation\CogStation.dmm"
		#include "map_files\TauStation\TauStation.dmm"
		#include "map_files\SyndicateStation\SyndicateBoxStation.dmm"
		#include "splurt_maps\map_files\Smexistation\Snaxi_Splurt.dmm"
		#include "map_files\BoxedInStation\BoxedInStation.dmm"

		#ifdef CIBUILDING
			#include "templates.dm"
		#endif
	#endif
#endif
