//#define LOWMEMORYMODE //uncomment this to load centcom and runtime station and thats it.

#include "map_files\generic\CentCom.dmm"

#ifndef LOWMEMORYMODE
	#ifdef ALL_MAPS
		#include "map_files\Zion-Road\Zion-Road-Lower.dmm"
		#include "map_files\Zion-Road\Zion-Road-New.dmm"
		#include "map_files\Zion-Road\Zion-Road-Upper.dmm"
		#ifdef TRAVISBUILDING
			#include "templates.dm"
		#endif
	#endif
#endif
