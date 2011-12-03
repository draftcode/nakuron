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

-(PieceBody*)moveTo:(PieceBody *)target {
    if ([target waitFor:self]) {
        return nil;
    } else {
        return self;
    }
}

-(NSString*)toString {
    return [color getName];
}

-(NSString*)getImageFilneName {
    return imageFileName;
}

-(Color*)getColor {
    return color;
}

-(PieceBody*)initWithColor:(Color*)c {
    color = c;
    imageFileName = [[NSString alloc] initWithFormat:@"b%@.png",[c getName]];
    return self;
}

@end
