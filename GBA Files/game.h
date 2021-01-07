typedef struct {
    int row; 
    int col;
    int height;
    int width;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int rdel;
    int isJumping;
    int jumpRow;
    int lane;
    int buffed;
    int tempInvincible;
} PLAYER;

typedef struct {
    int row; 
    int col;
    int height;
    int width;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int health;
    int active;
    int fireTimer;
    int onScreen;
    int enemyNum;
} ENEMY;

typedef struct {
	int row;
	int col;
	int rdel;
	int cdel;
	int height;
	int width;  
	int active;
    int bulletSpeed;
} BULLET;


typedef struct {
    int row;
    int col;
    int tempCol;
    int height;
    int width;
    int speed;
    int curFrame;
    int active;
} OBSTACLE;

typedef struct {
    int row;
    int col;
    int tempCol;
    int height;
    int width;
    int speed;
    int curFrame;
    int active;
} BUFF;

typedef struct {
    int row;
    int col;
    int width;
    int height;
    int index;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int active;
} SCORE;

typedef struct {
    int row;
	int col;
	int width;
    int height;
    int index;
    int active;
} LIFE;


#define BULLETCOUNT 3
#define ENEMYCOUNT 3
#define ENEMYBULLETCOUNT 3
#define OBSTACLECOUNT 2
#define LANE1 75
#define LANE2 107
#define LANE3 139
extern int lives;
extern int tempLives;
unsigned short hOff;

void initGame();
void updateGame();
void drawGame();

void initPlayer();
void updatePlayer();
void drawPlayer();

void initEnemy();
void updateEnemy(ENEMY *);
void drawEnemy();

void initBullets();
void fireBullet();
void updateBullet(BULLET *);
void drawBullet();

void initEnemyBullet();
void fireEnemyBullet(int enemyNum);
void updateEnemyBullet(BULLET *);
void drawEnemyBullet();

void initObstacles();
void updateObstacles(OBSTACLE *);
void drawObstacles(OBSTACLE *);

void initBuff();
void updateBuff();
void drawBuff();

void initScore();
void updateScore();
void drawScore();

void initLives();
void updateLives();
void drawLives(LIFE *);

int getPlayerLane();
int getRandLane();
int sameLane(int x, int y);
void updateDifficulty();
int laneFree(int lane);

