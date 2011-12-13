//
//  Ball.m
//  nakuron
//

#import "Ball.h"
#import "Empty.h"

@implementation Ball

-(bool)waitFor:(Piece*)target _self:(Piece*)_self {
    return false;
}

-(bool)canMove {
    return true;
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
