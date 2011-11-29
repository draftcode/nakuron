//
//  Wall.m
//  nakuron
//

#import "Wall.h"

@implementation Wall

-(Piece*)init {
    imageFileName = @"wall.png";
    image = [UIImage imageNamed:imageFileName];
    return self;
}

@end
