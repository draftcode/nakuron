//
//  Ball.m
//  nakuron
//

#import "Ball.h"
#import "Empty.h"

@implementation Ball

-(bool)waitFor:(Ball*)b {
    return false;
}

-(bool)moveTo:(Piece *)target {
    return [target waitFor:self];
}

-(Color*)getColor {
    return color;
}

-(Piece*)initWithColor:(Color*)c {
    color = c;
    imageFileName = [[NSString alloc] initWithFormat:@"b%@.png",[c getName]];
    image = [UIImage imageNamed:imageFileName];
    return self;
}

@end
