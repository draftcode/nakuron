//
//  ColorBall.h
//  nakuron
//

#import <Foundation/Foundation.h>
#import "Ball.h"

enum Color {
    COLOR_RED,
    COLOR_BLUE,
    COLOR_GREEN,
    COLOR_YELLOW,
} Color;

@interface ColorBall : Ball {
@private
    enum Color color;
}

-(id)init:(enum Color)c;

@end
