//
//  Ball.m
//  nakuron
//

#import "Ball.h"

@implementation Ball

-(Piece*)initWithColor:(Color*)c {
    color = c;
    imageFileName = [[NSString alloc] initWithFormat:@"b%@.png",[c getName]];
    image = [UIImage imageNamed:imageFileName];
    return self;
}

@end
