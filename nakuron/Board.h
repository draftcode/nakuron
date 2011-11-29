//
//  Board.h
//  nakuron
//

#import <Foundation/Foundation.h>
#import "Ball.h"

@interface Board : NSObject {
@private
    NSMutableArray *pieces;

    int BOARD_SIZE;

    int BOARD_SIZE_PX;
    int START_X_PX, START_Y_PX, END_X_PX, END_Y_PX;
    int CELL_SIZE_PX;
}

-(Board*)initWithSize:(int)size;

-(int)getBoardSize;

-(void)updatePieces;

-(id)getPieces;

-(CGRect)getCoordPxWithCoord:(int)x y:(int)y;
-(Piece*)getPieceWithCorrd:(int)x y:(int)y;

@end
