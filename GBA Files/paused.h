
//{{BLOCK(paused)

//======================================================================
//
//	paused, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 435 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 13920 + 2048 = 16480
//
//	Time-stamp: 2020-11-02, 00:19:02
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_PAUSED_H
#define GRIT_PAUSED_H

#define pausedTilesLen 13920
extern const unsigned short pausedTiles[6960];

#define pausedMapLen 2048
extern const unsigned short pausedMap[1024];

#define pausedPalLen 512
extern const unsigned short pausedPal[256];

#endif // GRIT_PAUSED_H

//}}BLOCK(paused)
