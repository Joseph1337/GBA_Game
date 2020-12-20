
//{{BLOCK(road)

//======================================================================
//
//	road, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 54 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 1728 + 4096 = 6336
//
//	Time-stamp: 2020-11-03, 13:16:55
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_ROAD_H
#define GRIT_ROAD_H

#define roadTilesLen 1728
extern const unsigned short roadTiles[864];

#define roadMapLen 4096
extern const unsigned short roadMap[2048];

#define roadPalLen 512
extern const unsigned short roadPal[256];

#endif // GRIT_ROAD_H

//}}BLOCK(road)
