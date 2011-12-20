//
//  Board.h
//  nakuron
//

#import <Foundation/Foundation.h>
#import "Piece.h"
#import "Ball.h"

typedef enum {
  LEFT,
  UP,
  RIGHT,
  DOWN
} Direction;

@interface Board : NSObject {
@private
  int score;
  NSMutableArray *pieces;

@public
  int BOARD_SIZE;
  int BOARD_SIZE_PX;
  int START_X_PX, START_Y_PX, END_X_PX, END_Y_PX;
  int CELL_SIZE_PX;
}

-(Board*)initWithSize:(int)size seed:(int)seed colors:(NSMutableArray*)colors;

-(int)getBoardSize;

-(void)updatePieces;

-(id)getPieces;

-(void)move:(Direction)d;

-(CGRect)getCoordPxWithCoord:(int)x y:(int)y;
-(Piece*)getPieceWithCorrd:(int)x y:(int)y;

@end
