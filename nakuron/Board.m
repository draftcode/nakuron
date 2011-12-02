//
//  Board.m
//  nakuron
//

#import "nakuronViewController.h"
#import "Board.h"
#import "Ball.h"
#import "Empty.h"
#import "Wall.h"
#import "Hole.h"
#import "ProgrammingException.h"

@implementation Board

-(Board*)initWithSize:(int)size colors:(NSMutableArray*)colors {
    score = 0;
    CGFloat w = [nakuronViewController getScreenWidth];
    CGFloat h = [nakuronViewController getScreenHeight];

    // 盤面サイズ
    // (1,1) ... (BOARD_SIZE-2,BOARD_SIZE-2) が、球の存在しうる領域
    BOARD_SIZE = size + 2;

    // 盤面サイズ (px) の定義
    BOARD_SIZE_PX = (w * 12) / 16;

    // 盤面描画エリアを取得
    START_X_PX = (w - BOARD_SIZE_PX) / 2;
    START_Y_PX = (h - BOARD_SIZE_PX) / 2;
    END_X_PX = w - START_X_PX;
    END_Y_PX = h - START_Y_PX;

    // 1マスのサイズ
    CELL_SIZE_PX = (END_X_PX - START_X_PX) / BOARD_SIZE;

    // 縦480px、横320px の場合
    // BOARD_SIZE = 240,
    // START_X = 40, START_Y = 120, END_X = 280, END_Y = 360,

    srand(time(nil));
    
    // BOARD_SIZE ぶんの領域を確保して pieces を初期化
    pieces = [[NSMutableArray alloc] initWithCapacity:BOARD_SIZE];
    for (int i = 0; i < BOARD_SIZE; i++) {
        // pieces[i] を初期化
        [pieces insertObject:[[NSMutableArray alloc] initWithCapacity:BOARD_SIZE] atIndex:i];
        for (int j = 0; j < BOARD_SIZE; j++) {
            // pieces[i][j] を初期化
            Piece *tmp;
            if (i == 0 || j == 0 || i == BOARD_SIZE-1 || j == BOARD_SIZE-1) {
                // 4隅
                if (i+j == 0 || i+j == BOARD_SIZE-1 || i+j == 2*(BOARD_SIZE-1)) {
                    tmp = [[Wall alloc] init];
                } else {
                    tmp = [[Hole alloc]
                           initWithColor:[colors objectAtIndex:rand()%[colors count]]];
                }
            } else {
                if ((rand() % [colors count]) == 0) {
                    tmp = [[Wall alloc] init];
                } else {
                    tmp = [[Ball alloc]
                           initWithColor:[colors objectAtIndex:rand()%[colors count]]];
                }
            }
            [tmp setFrame:[self getCoordPxWithCoord:i y:j]];
            [tmp setImage:[tmp getImage]];
            [[pieces objectAtIndex:i]
             insertObject:tmp
             atIndex:j];
        }
    }

    return self;
}

-(int)getBoardSize {
    return BOARD_SIZE;
}

-(int)getScore {
    return score;
}

-(void)updatePieces {

}

-(void)move:(Direction)d {
    int start, end, dx, dy;
    switch (d) {
        case LEFT: start = 1; end = BOARD_SIZE-1; dy = 0; dx = 1; break;
        case UP: start = 1; end = BOARD_SIZE-1; dy = 1; dx = 0; break;
        case RIGHT: start = BOARD_SIZE-2; end = 0; dy = 0; dx = -1; break;
        case DOWN: start = BOARD_SIZE-2; end = 0; dy = -1; dx = 0; break;
    }
    if (dx == 0) {
       // 縦方向
        for (int i = 1; i != BOARD_SIZE; i++) {
            Piece *target = [self getPieceWithCorrd:i y:end];
            for (int j = start; j != end; j += dy) {
                if (!((start <= j && j <= end) || (end <= j && j <= start))) {
                    [ProgrammingException error:@"ループ変数がボードの範囲外"];
                }
            }
        }
    } else {
        // 横方向

    }
}

-(id)getPieces {
    return pieces;
}

-(CGRect)getCoordPxWithCoord:(int)x y:(int)y {
    //if (1 <= cell_x && cell_x <= BOARD_SIZE
    //    && 1 <= cell_y && cell_y <= BOARD_SIZE) {
        return CGRectMake(START_X_PX+x*CELL_SIZE_PX,
                          START_Y_PX+y*CELL_SIZE_PX,
                          CELL_SIZE_PX,
                          CELL_SIZE_PX);
    //} else {
    //    return nil;
    //}
}

-(Piece*)getPieceWithCorrd:(int)x y:(int)y {
    return [[pieces objectAtIndex:x] objectAtIndex:y];
}

@end

/*
 // こんな感じにすれば画像を表示できる
 UIImage *img = [UIImage imageNamed:@"sgreen.png"];
 UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(50,50,50,50)];
 imageview.image = img;
 [self.view addSubview:imageview];
 */
