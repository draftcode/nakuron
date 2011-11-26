//
//  Board.m
//  nakuron
//

#import "nakuronViewController.h"
#import "Board.h"
#import "Ball.h"

@implementation Board

-(id)initWithSize:(int)size {
    CGFloat w = [nakuronViewController getScreenWidth];
    CGFloat h = [nakuronViewController getScreenHeight];
    
    // 盤面サイズ
    BOARD_SIZE = size;

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
    
    // size ぶんの領域を確保して pieces を初期化
    pieces = [[NSMutableArray alloc] initWithCapacity:size];
    for (int i = 0; i < size; i++) {
        // pieces[i] を初期化
        [pieces insertObject:[[NSMutableArray alloc] initWithCapacity:size] atIndex:i];
        for (int j = 0; j < size; j++) {
            // pieces[i][j] にオブジェクト設定。とりあえず赤玉
            [[pieces objectAtIndex:i]
             insertObject:[[Ball alloc] initWithColor:[[Color alloc] initWithColorName:@"red"]]
             atIndex:j];
        }
    }

    return self;
}

-(id)getPieces {
    return pieces;
}

-(int)getBoardSize {
    return BOARD_SIZE;
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
