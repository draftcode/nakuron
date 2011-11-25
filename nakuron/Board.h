//
//  Board.h
//  nakuron
//

#import <Foundation/Foundation.h>
#import "Ball.h"

@interface Board : NSObject {
@private
    NSMutableArray *cells;
    
    int BOARD_SIZE;
    
    int BOARD_SIZE_PX;
    int START_X_PX, START_Y_PX, END_X_PX, END_Y_PX;
    int CELL_SIZE_PX;
}

-(id)initWithSize:(int)size;

-(int)getBoardSize;

-(CGRect)getCoordWithCell:(int)cell_x cell_y:(int)cell_y;

@end
