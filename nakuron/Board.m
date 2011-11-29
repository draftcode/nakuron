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

@implementation Board

-(Board*)initWithSize:(int)size {
    CGFloat w = [nakuronViewController getScreenWidth];
    CGFloat h = [nakuronViewController getScreenHeight];

    // 盤面サイズ
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
                           initWithColor:[[Color alloc] initWithColorName:@"red"]];
                }
            } else {
                tmp = [[Ball alloc]
                       initWithColor:[[Color alloc] initWithColorName:@"red"]];
            }
            [tmp setFrame:[self getCoordPxWithCoord:i+1 y:j+1]];
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

-(void)updatePieces {

}

-(id)getPieces {
    return pieces;
}

-(CGRect)getCoordPxWithCoord:(int)x y:(int)y {
    //if (1 <= cell_x && cell_x <= BOARD_SIZE
    //    && 1 <= cell_y && cell_y <= BOARD_SIZE) {
        return CGRectMake(START_X_PX+(x-1)*CELL_SIZE_PX,
                          START_Y_PX+(y-1)*CELL_SIZE_PX,
                          CELL_SIZE_PX,
                          CELL_SIZE_PX);
    //} else {
    //    return nil;
    //}
}

-(Piece*)getPieceWithCorrd:(int)x y:(int)y {
    return [[pieces objectAtIndex:x-1] objectAtIndex:y-1];
}

@end

/*
 // こんな感じにすれば画像を表示できる
 UIImage *img = [UIImage imageNamed:@"sgreen.png"];
 UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(50,50,50,50)];
 imageview.image = img;
 [self.view addSubview:imageview];
 */
