
//{{BLOCK(cityscape)

//======================================================================
//
//	cityscape, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 711 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 22752 + 4096 = 27360
//
//	Time-stamp: 2020-11-03, 13:07:50
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_CITYSCAPE_H
#define GRIT_CITYSCAPE_H

#define cityscapeTilesLen 22752
extern const unsigned short cityscapeTiles[11376];

#define cityscapeMapLen 4096
extern const unsigned short cityscapeMap[2048];

#define cityscapePalLen 512
extern const unsigned short cityscapePal[256];

#endif // GRIT_CITYSCAPE_H

//}}BLOCK(cityscape)
