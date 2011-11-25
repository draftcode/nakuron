//
//  ColorBall.h
//  nakuron
//

#import <Foundation/Foundation.h>
#import "Ball.h"

enum Color {
    BALL_RED,
    BALL_BLUE,
    BALL_GREEN,
    BALL_YELLOW,
} Color;

@interface ColorBall : Ball {
@private
    enum Color color;
}

-(id)initWithColor:(enum Color)c;

@end
