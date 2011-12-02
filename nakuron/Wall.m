//
//  Wall.m
//  nakuron
//

#import "Wall.h"

@implementation Wall

-(bool)waitFor:(Ball *)b {
    return false;
}

-(bool)moveTo:(Piece *)target {
    return false;
}

-(Piece*)init {
    imageFileName = @"wall.png";
    image = [UIImage imageNamed:imageFileName];
    return self;
}

@end
