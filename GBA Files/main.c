/***Gran Touismo: Reloaded
    A shooter racing game where the play takes control of a vehicle in an endless runner. There is no goal but to simply survive for as long as you can.
    There will be incoming obstacles which the player must jump over as well as enemies that spawn and shoot which the player can destroy by firing back.
    Earn points for destroying enemies and surviving. 
    Note: Enemies can shoot over obstacles but the player cannot
    Controls: WASD = Arrow keys, K(B) = Jump, L(A)= Shoot
***/


//M03 Iterations: Added shield buff to protect player from losing health, added ability to spawn more enemies (up to 3) as well as exit animations, added score counter, added lives, added difficulty update

//M04 Iterations: Added new sprites, added background music and sfx for shooting, jumping and being hit, added flicker when hit

#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "start.h"
#include "cityscape.h"
#include "road.h"
#include "paused.h"
#include "lose.h"
#include "game.h"
#include "sound.h"
#include "instructions.h"
#include "startSong.h"
#include "pauseSong.h"
#include "gameSong.h"
#include "loseSong.h"
// Prototypes
void initialize();

// State Prototypes
void goToStart();
void start();
void goToGame();
void game();
void goToPause();
void pause();
void goToLose();
void lose();
void goToInstructions();
void instructions();


// States
enum
{
    START,
    GAME,
    PAUSE,
    LOSE,
    INSTRUCTIONS
};
int state;

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Shadow OAM
OBJ_ATTR shadowOAM[128];

int seed;

int main()
{
    initialize();

    while (1)
    {
        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;

        // State Machine
        switch (state)
        {
        case START:
            start();
            break;
        case GAME:
            game();
            break;
        case PAUSE:
            pause();
            break;
        case LOSE:
            lose();
            break;
        
        case INSTRUCTIONS:
            instructions();
            break;
        }
    }
}

// Sets up GBA
void initialize()
{
    REG_DISPCTL = MODE0;
    buttons = BUTTONS;
    oldButtons = 0;

    setupSounds();
	setupInterrupts();

    
    goToStart();
}

// Sets up the start state 
void goToStart() {
    REG_DISPCTL = BG0_ENABLE;
    REG_BG0CNT = BG_8BPP | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    DMANow(3, startTiles, &CHARBLOCK[0], startTilesLen / 2 );
    DMANow(3, startMap, &SCREENBLOCK[28], startMapLen / 2);
    DMANow(3, startPal, PALETTE, startPalLen / 2);  

    stopSound();  
	playSoundA(startSong_data, startSong_length, 1);

    state = START;

}

// Runs every frame of the start state
void start() {
    seed++;
    if (BUTTON_PRESSED(BUTTON_START)) {
        srand(seed);
        goToInstructions();
     }

    
}  

// Sets up the game state
void goToGame() {
    REG_DISPCTL = BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;
    DMANow(3, cityscapePal, PALETTE, 256); 

    REG_BG1CNT = BG_4BPP | BG_SIZE_WIDE | BG_CHARBLOCK(1) | BG_SCREENBLOCK(30);
    DMANow(3, cityscapeTiles, &CHARBLOCK[1], cityscapeTilesLen / 2 );  
    DMANow(3, cityscapeMap, &SCREENBLOCK[30], cityscapeMapLen / 2);


    REG_BG0CNT = BG_4BPP | BG_SIZE_WIDE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    DMANow(3, roadTiles, &CHARBLOCK[0], roadTilesLen / 2 );
    DMANow(3, roadMap, &SCREENBLOCK[28], roadMapLen / 2);
     
    state = GAME;
}

// Runs every frame of the game state
void game() {
    updateGame();
    drawGame();
    if(tempLives == 0) {
        goToLose();
    }

    if(BUTTON_PRESSED(BUTTON_START)) {
        pauseSound();
        goToPause();
    }
}

// Sets up the pause state
void goToPause() {
    state = PAUSE;
    REG_DISPCTL = BG0_ENABLE;
    REG_BG0CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    DMANow(3, pausedTiles, &CHARBLOCK[0], pausedTilesLen / 2 );
    DMANow(3, pausedMap, &SCREENBLOCK[28], pausedMapLen / 2);
    DMANow(3, pausedPal, PALETTE, pausedPalLen / 2); 
    playSoundB(pauseSong_data, pauseSong_length, 1);

}

// Runs every frame of the pause state
void pause() {
    REG_BG0HOFF = 0;
      if(BUTTON_PRESSED(BUTTON_START)) {
        stopSoundB();
        unpauseSound();
        goToGame();
    }
      if(BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}

// Sets up the lose state
void goToLose() {
    state = LOSE;
    REG_DISPCTL = BG0_ENABLE;
    REG_BG0CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    DMANow(3, loseTiles, &CHARBLOCK[0], loseTilesLen / 2 );
    DMANow(3, loseMap, &SCREENBLOCK[28], loseMapLen / 2);
    DMANow(3, losePal, PALETTE, losePalLen / 2); 
  
    stopSound();
	playSoundA(loseSong_data, loseSong_length, 1);
}

// Runs every frame of the lose state
void lose() {
    REG_BG0HOFF = 0;
       if(BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

void goToInstructions() {
    state = INSTRUCTIONS;
    REG_DISPCTL = BG0_ENABLE;
    REG_BG0CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    DMANow(3, instructionsTiles, &CHARBLOCK[0], instructionsTilesLen / 2 );
    DMANow(3, instructionsMap, &SCREENBLOCK[28], instructionsMapLen / 2);
    DMANow(3, instructionsPal, PALETTE, instructionsPalLen / 2); 
}

void instructions() {
    REG_BG0HOFF = 0;
    if(BUTTON_PRESSED(BUTTON_START)) {
        stopSound();
        playSoundA(gameSong_data, gameSong_length, 1);
        goToGame();
        initGame();
    }
  
    
} 