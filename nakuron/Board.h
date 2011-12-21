//
//  Board.h
//  nakuron
//

#import <Foundation/Foundation.h>

@class Piece;

typedef enum {
  LEFT,
  UP,
  RIGHT,
  DOWN
} Direction;

@interface Board : NSObject {
@private
  int score;
  NSArray *pieces;

@public
  int BOARD_SIZE;
  int BOARD_SIZE_PX;
  int START_X_PX, START_Y_PX, END_X_PX, END_Y_PX;
  int CELL_SIZE_PX;
}

-(void)dump;

-(Board*)initWithSize:(int)size seed:(int)seed colors:(NSArray*)colors;

-(int)getBoardSize;

-(void)updatePieces;

-(void)move:(Direction)d;

-(CGRect)getCoordPxWithCoord:(int)x y:(int)y;
-(Piece*)getPieceWithCorrd:(int)x y:(int)y;

@end
