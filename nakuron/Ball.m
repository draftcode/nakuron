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

-(Piece*)moveTo:(Piece *)target {
    if ([target waitFor:self]) {
        return nil;
    } else {
        return self;
    }
}

-(NSString*)toString {
    return [color getName];
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
