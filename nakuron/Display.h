//
//  Display.h
//  nakuron
//

#import <Foundation/Foundation.h>
#import "Board.h"
#import "Ball.h"
#import "ColorBall.h"
#import "Wall.h"
#import "Empty.h"

@interface Display : NSObject {
@private
    Board *board;
    int SCREEN_WIDTH;
    int SCREEN_HEIGHT;
}

-(id)init;

-(id)getBoard;

+(CGFloat)getScreenWidth;
+(CGFloat)getScreenHeight;

@end
