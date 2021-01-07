#include <stdlib.h>
#include "myLib.h"
#include "game.h"
#include "spritesheet.h"
#include "sound.h"
#include "shootingSfx.h"
#include "jumpSfx.h"
#include "hitSfx.h"

OBJ_ATTR shadowOAM[128];

PLAYER player;
ENEMY enemy[ENEMYCOUNT];
BULLET bullets[BULLETCOUNT];
BULLET enemyBullets[ENEMYBULLETCOUNT];
OBSTACLE obstacle[OBSTACLECOUNT];
BUFF buff;
SCORE score[9];
LIFE livesObject[3];
int gravity;
int lives;
int timer;
int increment;
int newtimer;
int tempLives;
int invulnerabilityTimer;
int hOffdel;
int temp;
int obstaclespeed;

void initGame() {
    DMANow(3, spritesheetPal, SPRITEPALETTE, 256);
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);
    hideSprites();

    lives = 3;
    tempLives = lives;
    timer = 0;
    increment = SHIFTUP(0);
    invulnerabilityTimer = 0;
    hOffdel = 0;
    temp = 0;
    obstaclespeed = SHIFTUP(0);


    initPlayer();
    initEnemy();
    initEnemyBullet();
    initBullets();
    initObstacles();
    initBuff();
    initScore();
    initLives();
}

void updateGame() {
    updateDifficulty();
    for (int i =0; i < OBSTACLECOUNT; i++) {
        updateObstacles(&obstacle[i]);
    }
    for (int i = 0; i < ENEMYCOUNT; i++) {
        updateEnemy(&enemy[i]);
    }
    for (int i = 0; i < ENEMYBULLETCOUNT; i++) {
		updateEnemyBullet(&enemyBullets[i]);
    }

    for (int i = 0; i < BULLETCOUNT; i++) {
		updateBullet(&bullets[i]);
    }
    updatePlayer();
    updateBuff();
    updateScore();
    updateLives();
    timer++;
    invulnerabilityTimer--;
}

void drawGame() {
    drawPlayer();
    drawBullet();
    drawEnemy();
    drawEnemyBullet();
    for (int i =0; i < OBSTACLECOUNT; i++) {
        drawObstacles(&obstacle[i]);
    }
    for(int i = 0; i < 3; i++) {
        drawLives(&livesObject[i]);
    }

    drawBuff();
    drawScore();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);
}

//==========================================PLAYER==========================================
void initPlayer() {
    player.row = LANE1;
    player.jumpRow = SHIFTUP(player.row);
    player.col = 20;
    player.height = 16;//16;
    player.width = 45;//32;
    player.aniCounter = 0;
    player.curFrame = 0;
    player.numFrames = 6; 
    player.aniState = 0;
    player.rdel = 0;
    player.isJumping = 0;
    player.lane = getPlayerLane();
    player.tempInvincible = 0;
    player.buffed = 0;
}

int getPlayerLane() {
    if(SHIFTDOWN(player.jumpRow) >= 0 && SHIFTDOWN(player.jumpRow) < LANE2) {
        return 1;
    } else if (SHIFTDOWN(player.jumpRow) >= LANE2 && SHIFTDOWN(player.jumpRow) < LANE3) {
        return 2;
    } else {
        return 3;
    }
}

void updatePlayer() {
    //cheat code
    if(BUTTON_HELD(BUTTON_SELECT)) { //slows time
        REG_BG1HOFF = hOff + SHIFTDOWN(hOffdel);
        REG_BG0HOFF = 2 * (hOff + SHIFTDOWN(hOffdel));

        temp = SHIFTUP(2);
        for (int i = 0; i < ENEMYBULLETCOUNT; i++) {
            enemyBullets[i].bulletSpeed = 2;
        }
        
    } else {
        for (int i = 0; i < ENEMYBULLETCOUNT; i++) { //return regular bullet speed
            enemyBullets[i].bulletSpeed = 3;
        }
    }

    //lane movement
    if (BUTTON_HELD(BUTTON_LEFT) && player.col >= 0) {
        player.col -= 1;
    } else if (BUTTON_HELD(BUTTON_RIGHT) && player.col + player.width - 1 < SCREENWIDTH - 1) {
        player.col += 3;
    } 
    if (BUTTON_PRESSED(BUTTON_DOWN) && player.row + player.height + 32 < 160 && !player.isJumping) {
        player.rdel = 0;
        player.jumpRow += SHIFTUP(32);
        player.lane = getPlayerLane();
    } else if (BUTTON_PRESSED(BUTTON_UP) && player.row > LANE1 && !player.isJumping) { 
        player.rdel = 0;
        player.jumpRow -= SHIFTUP(32);
        player.lane = getPlayerLane();
    }

    //jump mechanic
    if(player.lane == 1) {
        if (SHIFTDOWN(player.jumpRow + player.rdel) <= LANE1) {
            player.jumpRow += player.rdel; 
        } else {
            player.rdel = 0;
            player.isJumping = 0;
        }
    } else if(player.lane == 2) {
        if(SHIFTDOWN(player.jumpRow + player.height - 1 + player.rdel) <= LANE2) {
            player.jumpRow += player.rdel;
        } else {
            player.rdel = 0;
            player.isJumping = 0;
        }
    } else if(player.lane == 3) {
        if(SHIFTDOWN(player.jumpRow + player.height - 1 + player.rdel) <= LANE3) {
            player.jumpRow += player.rdel;
        } else {
            player.rdel = 0;
            player.isJumping = 0;
        }
    }
    player.rdel += GRAVITY;

    if(BUTTON_PRESSED(BUTTON_B) && !player.isJumping) {
        playSoundB(jumpSfx_data, jumpSfx_length, 0);
        player.rdel -= JUMPPOWER;
        player.isJumping = 1;   
    }
    

    //copy over row edits to actual row
    player.row = SHIFTDOWN(player.jumpRow);

    //fire weapon
    if (BUTTON_PRESSED(BUTTON_A) && !player.isJumping) {
      
		fireBullet();
        
	}
    //move player backwards
    if (player.col > 1) {
        player.col -=2;
    }


     if(player.buffed) { //display buff if buffed
        player.aniState = 8; //player anistate
     } else if (!player.buffed && !player.tempInvincible){
        player.aniState = 0;
     }


    if(player.tempInvincible) {
        lives = lives;
        if(invulnerabilityTimer <= 0) {
            player.tempInvincible = 0;
            lives = tempLives;
            player.aniState = 0;
            player.curFrame = 0;
        }
    } 
    
     //update animation
     if(!player.tempInvincible) { 
        if(player.aniCounter % 10 == 0) {
            if (player.curFrame < player.numFrames - 1) {
                player.curFrame++;
            } else {
                player.curFrame = 0;
            }
        }
     } else {
         if(player.aniCounter % 5 == 0) {
            if (player.curFrame < 4) {
                player.curFrame++;
            } else {
                player.curFrame = 3;
            }
        }
     }
    player.aniCounter++; 
}

void drawPlayer() {
        shadowOAM[0].attr0 = (player.row & ROWMASK) | ATTR0_4BPP | ATTR0_WIDE;
        shadowOAM[0].attr1 = (player.col & COLMASK) | ATTR1_LARGE;
        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(player.aniState, 4 * player.curFrame);
    
}

//===================================ENEMY================================
void initEnemy() {
    for(int i = 0; i < ENEMYCOUNT; i++) {
        enemy[i].height = 22;
        enemy[i].width = 63;
        enemy[i].row = 69 + 32*i - 5;
        enemy[i].col = 240 + 2 * enemy[i].width - 3;
        enemy[i].aniCounter = 0;
        enemy[i].curFrame = 0;
        enemy[i].numFrames = 4; 
        enemy[i].aniState = 0;
        enemy[i].health = 3;
        enemy[i].active = 0;
        enemy[i].fireTimer = 0;
        enemy[i].onScreen = 0;
        enemy[i].enemyNum = i + 1;
    }
}

int laneFree(int lane) { //helper method so that multiple enemies cannot spawn in the same lane
    int empty = 1;
     for(int i = 0; i < ENEMYCOUNT; i++) {
         if(enemy[i].active) {
            if(lane == LANE1) {
                if(enemy[i].row == LANE1) {
                    empty = 0;
                } else {
                    empty = 1;
                }
            } else if (lane == LANE2) {
                if(enemy[i].row == LANE2) {
                    empty = 0;
                } else {
                    empty = 1;
                }
            } else if (lane == LANE3) {
                if(enemy[i].row == LANE3) {
                    empty = 0;
                } else {
                    empty = 1;
                }
            }
         }
     }
     return empty;
}

void updateEnemy(ENEMY *e) {
    int rng = getRandNum(250);
    if (rng == 1) {
        e->active = 1;
    }
    if(e->active) {
        if(e->col > 180 && e->onScreen < 300) { //move enemy to position
            e->col--;
        } else {
            e->fireTimer++;// gives time for enemy to come in before shooting
            e->onScreen++; //start counting how long the enemy has been on the screen for
        }
        for (int i = 0; i < BULLETCOUNT; i++) { //player bullet and enemy collision
            if(bullets[i].active && collision(e->col + 5, e->row, e->width, e->height, bullets[i].col, bullets[i].row, bullets[i].width, bullets[i].height)) { //if enemy collides with player bullet
                bullets[i].active = 0;
                e->health--; 
            } 
        }
        if(e->fireTimer == 50 && e->onScreen < 300) { //shoot bullets at given interval
            fireEnemyBullet(e->enemyNum);
            e->fireTimer = 0;
        }
        if(e->health <= 0) { //reset position/spawn new enemy
            
            e->active = 0;
            e->col = 240 + 2 * e->width - 3;
            e->onScreen = 0;
            e->health = 3;
            e->fireTimer = 0;
            if(score[3].curFrame != 9) {  //gives +100 pts if enemy is destroyed
                score[3].curFrame++;
            } else {
                score[4].curFrame++;
            }
        }
        
        if(e->onScreen > 300) { //enemy "despawns" after time
            if(e->col < 260) { //move enemy off screen
                e->col++;
            } else { //reset
                e->active = 0;
                e->col = 240 + 2 * e->width - 3;
                e->onScreen = 0;
                e->health = 3;
                e->fireTimer = 0;
            }
        }
    }

    //animations
    if(!BUTTON_HELD(BUTTON_SELECT)) { //if slow cheat is not active
        e->aniCounter++;
        if(e->aniCounter % 10 == 0) {
            if (e->curFrame < e->numFrames - 1) {
                e->curFrame++;
            } else {
                e->curFrame = 0;
            }
        }
    } else { //if cheat is active, make enemy move slower
        e->aniCounter++;
        if(e->aniCounter % 20 == 0) {
            if (e->curFrame < e->numFrames - 1) {
                e->curFrame++;
            } else {
                e->curFrame = 0;
            }
        }
    }
}

void drawEnemy() {
    for (int i = 0; i<ENEMYCOUNT; i++) {
	    if(enemy[i].active) {
            shadowOAM[1+i].attr0 = (enemy[i].row & ROWMASK) | ATTR0_4BPP | ATTR0_WIDE;
            shadowOAM[1+i].attr1 = (enemy[i].col & COLMASK) | ATTR1_LARGE;
            shadowOAM[1+i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(16, 4 * enemy[i].curFrame);
        } else {
            shadowOAM[1+i].attr0 = ATTR0_HIDE;
        }
	}
}

//=======================================BULLET=======================================
void initBullets() {
	for (int i = 0; i < BULLETCOUNT; i++) {
		bullets[i].height = 4; 
		bullets[i].width = 8;   
		bullets[i].active = 0;
	}
}

void fireBullet() {
    for (int i = 0; i < BULLETCOUNT; i++) {
		if (!bullets[i].active) {

			// Position the new bullet
			bullets[i].row = player.row + player.height/2 - bullets[i].width/2;
			bullets[i].col = player.col + player.width - 5;

			// Take the bullet out of the pool
			bullets[i].active = 1;
            playSoundB(shootingSfx_data, shootingSfx_length - 1000, 0);
			// Break out of the loop
			break;
		}
	}
}

void updateBullet(BULLET* b) {
	// If active, update; otherwise ignore
	if (b->active) {
        for(int i = 0; i<ENEMYCOUNT; i++) {
            if (b->col + b->width-1 <= SCREENWIDTH + b->width && !(collision(enemy[i].col, enemy[i].row, enemy[i].width, enemy[i].height, b->col, b->row, b->width, b->height))) { //if no collision
                b->col += 1;
            } else if(b->col + b->width-1 > SCREENWIDTH + b->width) {
                b->active = 0;
            }
        }

        for(int i = 0; i<OBSTACLECOUNT; i++) {
            if(collision(obstacle[i].col, obstacle[i].row, obstacle[i].width, obstacle[i].height,  b->col, b->row, b->width, b->height)) { //stop bullet if it hits an obstacle
                b->active = 0;
            }
        }
	}
}

void drawBullet() {
    for (int i = 0; i<BULLETCOUNT; i++) {
	    if(bullets[i].active) {
            shadowOAM[2+ENEMYCOUNT+i].attr0 = (bullets[i].row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[2+ENEMYCOUNT+i].attr1 = (bullets[i].col & COLMASK) | ATTR1_TINY;
            shadowOAM[2+ENEMYCOUNT+i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(27, 0);
        } else {
            shadowOAM[2+ENEMYCOUNT+i].attr0 = ATTR0_HIDE;
        }
	}
}
//===================================ENEMY BULLETS======================================
void initEnemyBullet() {
    for (int i = 0; i < ENEMYBULLETCOUNT; i++) {
		enemyBullets[i].height = 4; 
	    enemyBullets[i].width = 8;   
		enemyBullets[i].active = 0;
        enemyBullets[i].bulletSpeed = 3;
	}
}

void updateEnemyBullet(BULLET *b) {
    if(b->active) {
        if(!collision(player.col, player.row, player.width, player.height, b->col, b->row, b->width, b->height) && b->col + b->width > 0) { //no collision
            b->col -= b->bulletSpeed; 
        } else { //if there is a collision
            if(collision(player.col, player.row, player.width, player.height, b->col, b->row, b->width, b->height)) {
                if(!sameLane(player.row, b->row)) { //disregards collision if player collides as a result of jumping from lower lane
                    b->col -= b->bulletSpeed; 
                } else { //if there is collision
                    if(!player.buffed && !player.tempInvincible) { //if player is not buffed
                        b->active = 0;
                        lives--;
                        tempLives = lives;
                        player.tempInvincible = 1;
                        invulnerabilityTimer = 100;
                        player.aniState = 24;
                        player.curFrame = 3;
                        stopSoundB();
                        playSoundB(hitSfx_data, hitSfx_length, 0);
                    } else if (player.buffed){ //player is buffed
                        b->active = 0;
                        player.buffed = 0;
                    } else {
                        b->col -= b->bulletSpeed;
                    }
                }
            } else { //if there is no collision and bullet just goes off screen
                b->active = 0;
            }
        }
    }
}

void fireEnemyBullet(int enemyNum) {
    if(enemyNum == 1) {
        if (!enemyBullets[0].active) {
            // Position the new bullet
            enemyBullets[0].row = enemy[0].row + 12 + enemy[0].height/2 - enemyBullets[0].width/2;
            enemyBullets[0].col = enemy[0].col;
            // Take the bullet out of the pool
            enemyBullets[0].active = 1;
            playSoundB(shootingSfx_data, shootingSfx_length - 1000, 0);
        }
        
    } else if (enemyNum == 2) {
        if (!enemyBullets[1].active) {
            // Position the new bullet
            enemyBullets[1].row = enemy[1].row + 12 + enemy[1].height/2 - enemyBullets[1].width/2;
            enemyBullets[1].col = enemy[1].col;
            // Take the bullet out of the pool
            enemyBullets[1].active = 1;
            playSoundB(shootingSfx_data, shootingSfx_length - 1000, 0);
        }
    } else if (enemyNum == 3) {
        if (!enemyBullets[2].active) {
             // Position the new bullet
            enemyBullets[2].row = enemy[2].row + 12 + enemy[2].height/2 - enemyBullets[2].width/2;
            enemyBullets[2].col = enemy[2].col;
            // Take the bullet out of the pool
            enemyBullets[2].active = 1;   
            playSoundB(shootingSfx_data, shootingSfx_length - 1000, 0);
        }
    }
}


void drawEnemyBullet() {
     for (int i = 0; i<ENEMYBULLETCOUNT; i++) {
	    if(enemyBullets[i].active) {
            shadowOAM[4+ENEMYCOUNT+BULLETCOUNT+OBSTACLECOUNT+i].attr0 = (enemyBullets[i].row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[4+ENEMYCOUNT+BULLETCOUNT+OBSTACLECOUNT+i].attr1 = (enemyBullets[i].col & COLMASK) | ATTR1_TINY;
            shadowOAM[4+ENEMYCOUNT+BULLETCOUNT+OBSTACLECOUNT+i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(27, 1);
        } else {
            shadowOAM[4+ENEMYCOUNT+BULLETCOUNT+OBSTACLECOUNT+i].attr0 = ATTR0_HIDE; //hide if not active
        }
	}
}

//===================================OBSTACLE=======================================
void initObstacles() {
    for(int i=0; i<OBSTACLECOUNT; i++) {
        obstacle[i].col = 250;
        obstacle[i].row = getRandLane();
        obstacle[i].height = 16; 
        obstacle[i].width = 15; 
        obstacle[i].speed = 2;
        obstacle[i].active = 1;
        obstacle[i].curFrame = 7;
        obstacle[i].tempCol = SHIFTUP(obstacle[i].col);
    }
}

void updateObstacles(OBSTACLE *o) {
      if (o -> active) {
        if (!(collision(player.col, player.row, player.width, player.height, o->col, o->row, o->width, o->height))) { //if there is no collision
            if(o->col + o->width > 1) {
                o->tempCol -= temp;
                o->col = SHIFTDOWN(o->tempCol);
            } else {
                o->col = getRandNumRange(240,270);
                o->tempCol = SHIFTUP(o->col);
                o->row = getRandLane();
            }
        } else if(collision(player.col, player.row, player.width, player.height, o->col, o->row, o->width, o->height) && !player.isJumping){ //if there is collision
            if(!player.buffed && !player.tempInvincible) { //if player is not buffed
                stopSoundB();
                playSoundB(hitSfx_data, hitSfx_length, 0);
                lives--;
                tempLives = lives;
                player.tempInvincible = 1;
                invulnerabilityTimer = 100;
                player.aniState = 24;
                player.curFrame = 3;

                o->col = getRandNumRange(240,270);
                o->tempCol = SHIFTUP(o->col);
                o->row = getRandLane();
              
            } else if (player.buffed) { //player is buffed
                o->col = getRandNumRange(240,270);
                o->tempCol = SHIFTUP(o->col);
                o->row = getRandLane();
                player.buffed = 0;
            } else { //player is temporarily invincible
                o->tempCol -= temp;
                o->col = SHIFTDOWN(o->tempCol); 
            }
        } else if ((collision(player.col, player.row, player.width, player.height, o->col, o->row, o->width, o->height) && player.isJumping)) { //prevents accidental collision if player was jumping in a different lane
    
            o->tempCol -= temp;
            o->col = SHIFTDOWN(o->tempCol);
        }
    }
}

void drawObstacles(OBSTACLE *o) {
    if (o -> active) {
        for (int i=0; i<OBSTACLECOUNT; i++) {
                shadowOAM[3+ ENEMYCOUNT + BULLETCOUNT+i].attr0 = (obstacle[i].row & ROWMASK) | ATTR0_4BPP | ATTR0_WIDE;
                shadowOAM[3+ ENEMYCOUNT + BULLETCOUNT+i].attr1 = (obstacle[i].col & COLMASK) | ATTR1_MEDIUM;
                shadowOAM[3+ ENEMYCOUNT + BULLETCOUNT+i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(27, 2); 
            }
    }
}

//============================================BUFF==========================================

void initBuff() {
    buff.col = 250;
    buff.tempCol = SHIFTUP(buff.col);
    buff.row = getRandLane();
    buff.height = 16; 
    buff.width = 20; 
    buff.speed = 2;
    buff.active = 0;
    buff.curFrame = 10;
}

void updateBuff() {
    int rng = getRandNum(800);
    if (rng == 1) {
        buff.active = 1;
    }
    if (buff.active && !(player.buffed)) {
        if (buff.col > 0) { //move buff leftwards
            if (!(collision(buff.col, buff.row, buff.width, buff.height, player.col, player.row, player.width, player.height))) {
                buff.tempCol -= temp;
                buff.col = SHIFTDOWN(buff.tempCol);
            }else { //if collision with player, buff player
                if(!player.isJumping) {
                    player.buffed = 1;
                    buff.active = 0;
                    buff.row = getRandLane();
                    buff.col = 250;
                    buff.tempCol = SHIFTUP(buff.col); 
                } else {
                    buff.tempCol -= temp;
                    buff.col = SHIFTDOWN(buff.tempCol);
                }
            }
        } else { //else, reset position
            buff.active = 0;
            buff.row = getRandLane();
            buff.col = 250;
            buff.tempCol = SHIFTUP(buff.col);
        }
    } else {
        buff.active = 0;
    }
}

void drawBuff() {
     if (buff.active && !(player.buffed)) {
        shadowOAM[5+ENEMYCOUNT+BULLETCOUNT+OBSTACLECOUNT+ENEMYBULLETCOUNT].attr0 = (buff.row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[5+ENEMYCOUNT+BULLETCOUNT+OBSTACLECOUNT+ENEMYBULLETCOUNT].attr1 = (buff.col & COLMASK) | ATTR1_SMALL;
        shadowOAM[5+ENEMYCOUNT+BULLETCOUNT+OBSTACLECOUNT+ENEMYBULLETCOUNT].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(27, 5);
     } else {
        shadowOAM[5+ENEMYCOUNT+BULLETCOUNT+OBSTACLECOUNT+ENEMYBULLETCOUNT].attr0 = ATTR0_HIDE; //hide if not active
     }

}

//==================================SCORE===================================
void initScore() {
    for(int i=0; i<6; i++) {
        score[i].row = 3;
        score[i].col = 35 + i*8;
        score[i].aniCounter = 0;
        score[i].aniState = 0;
        score[i].curFrame = 0;
        score[i].numFrames = 11;
        score[i].active = 1;
        
    }
}

void updateScore() {
    for (int i = 5; i > -1; i--) {
        score[i].aniCounter++;
        if(i == 5) {
            // score[i].aniCounter++;
            if(score[i].aniCounter % 5 == 0) {
                if(score[i].curFrame < score[i].numFrames - 1) {
                    score[i].curFrame++;
                } else {
                    score[i].curFrame = 1;
                }
                newtimer = 0;
            }
        } else {
           // score[i].aniCounter++;
            if(score[i+1].curFrame == 10 && score[i].curFrame < score[i].numFrames - 1 && newtimer == 0) {
                score[i].curFrame++;
            } else if (score[i].curFrame >= score[i].numFrames - 1 && newtimer == 0){
                score[i].curFrame = 0;
            } 
        }
    }
    newtimer++;
}

void drawScore() {
    for(int i=5; i>-1; i--) { //draw individual numbers
        shadowOAM[6+ENEMYCOUNT+BULLETCOUNT+OBSTACLECOUNT+ENEMYBULLETCOUNT + i].attr0 = (score[i].row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[6+ENEMYCOUNT+BULLETCOUNT+OBSTACLECOUNT+ENEMYBULLETCOUNT + i].attr1 = (score[i].col & COLMASK) | ATTR1_TINY;
        shadowOAM[6+ENEMYCOUNT+BULLETCOUNT+OBSTACLECOUNT+ENEMYBULLETCOUNT + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(score[i].curFrame, 26);
    } //draw "SCORE:"
    shadowOAM[7+ENEMYCOUNT+BULLETCOUNT+OBSTACLECOUNT+ENEMYBULLETCOUNT + 6].attr0 = ((3) & ROWMASK) | ATTR0_4BPP | ATTR0_WIDE;
    shadowOAM[7+ENEMYCOUNT+BULLETCOUNT+OBSTACLECOUNT+ENEMYBULLETCOUNT + 6].attr1 = (0 & COLMASK) | ATTR1_MEDIUM;
    shadowOAM[7+ENEMYCOUNT+BULLETCOUNT+OBSTACLECOUNT+ENEMYBULLETCOUNT + 6].attr2 =  ATTR2_PALROW(0) | ATTR2_TILEID(0, 24);
    
    
}
//=========================================LIVES=============================================
void initLives() { //initialize lives remaining
    for (int i =0; i<3; i++) {
        livesObject[i].row = 3;
        livesObject[i].col = 208 + 10*i;
        livesObject[i].height = 8;
        livesObject[i].width = 8;
        livesObject[i].active = 1;
        livesObject[i].index = i;
    }
}

void updateLives() { //update the lives to be drawn
    if(lives == 2) {
        livesObject[2].active = 0;
    }
    if (lives == 1) {
		livesObject[1].active = 0;
	}
	if (lives == 0) {
		livesObject[0].active = 0;
	}
}
void drawLives(LIFE* x) { //draw lives
	if (x->active) {
                shadowOAM[8+ENEMYCOUNT+BULLETCOUNT+OBSTACLECOUNT+ENEMYBULLETCOUNT + 6 +x->index].attr0 = x->row | ATTR0_4BPP | ATTR0_SQUARE;
                shadowOAM[8+ENEMYCOUNT+BULLETCOUNT+OBSTACLECOUNT+ENEMYBULLETCOUNT + 6 +x->index].attr1 = x->col | ATTR1_TINY;
                shadowOAM[8+ENEMYCOUNT+BULLETCOUNT+OBSTACLECOUNT+ENEMYBULLETCOUNT + 6 +x->index].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 30);
        
    } else {
            shadowOAM[8+ENEMYCOUNT+BULLETCOUNT+OBSTACLECOUNT+ENEMYBULLETCOUNT + 6 +x->index].attr0 = ATTR0_HIDE;
        
    }
    shadowOAM[9+ENEMYCOUNT+BULLETCOUNT+OBSTACLECOUNT+ENEMYBULLETCOUNT + 6 + 3].attr0 = ((3) & ROWMASK) | ATTR0_4BPP | ATTR0_WIDE;
    shadowOAM[9+ENEMYCOUNT+BULLETCOUNT+OBSTACLECOUNT+ENEMYBULLETCOUNT + 6 + 3].attr1 = (174 & COLMASK) | ATTR1_MEDIUM;
    shadowOAM[9+ENEMYCOUNT+BULLETCOUNT+OBSTACLECOUNT+ENEMYBULLETCOUNT + 6 + 3].attr2 =  ATTR2_PALROW(0) | ATTR2_TILEID(0, 28);
    
    

}

//=============================================MISC=============================================
int getRandLane() { //gets a random lane (1,2 or 3)
    int randomNum = getRandNumRange(1, 3);
    if(randomNum == 1) {
        return LANE1;
  
    } else if (randomNum == 2) {
        return LANE2;
    } else {
        return LANE3;
    }
}

void updateDifficulty() { //Adjusts difficulty of game by gradually increment incoming speed
    hOff++;
    if(timer % 30 == 0) {
        if (SHIFTDOWN(increment) < 2) {
            increment += 1;
            obstaclespeed += 2;
        }
    }
 
    if(!BUTTON_HELD(BUTTON_SELECT)) {
        hOffdel += increment;
        temp = SHIFTUP(2) + obstaclespeed;

        REG_BG1HOFF = hOff + SHIFTDOWN(hOffdel) ; //skyline bg
        REG_BG0HOFF = 2 * (hOff + SHIFTDOWN(hOffdel)); //road bg
    }
}


int sameLane(int playerRow, int y) { //takes in the row of two objects and checks if they are in the same lane or not
    if(!player.isJumping) {
        if (playerRow>=0 && playerRow<LANE2 && y>=0 && y<LANE2 ) {
            return 1;
        } else if  (playerRow>=LANE2 && playerRow<LANE3 && y>=LANE2 && y<LANE3) {
            return 1;
        } else if  (playerRow>=LANE3 && playerRow<159 && y>=LANE2 && y<159) {
            return 1;
        } else {
            return 0;
        }
    } else {
        if (playerRow + 40>=0 && playerRow + 40<LANE2 && y>=0 && y<LANE2 ) {
            return 1;
        } else if  (playerRow + 40>=LANE2 && playerRow + 40 <LANE3 && y>=LANE2 && y<LANE3) {
            return 1;
        } else if  (playerRow + 40>=LANE3 && playerRow <159 && y>=LANE3 && y<159) {
            return 1;
        } else {    
            return 0;
        }
    }
}

