//
//  Wall.m
//  nakuron
//

#import "Wall.h"

@implementation Wall

-(bool)waitFor:(Ball *)b {
    return false;
}

-(Piece*)moveTo:(Piece *)target {
    return self;
}

-(NSString*)toString {
    return @"Wall";
}

-(Piece*)init {
    imageFileName = @"wall.png";
    image = [UIImage imageNamed:imageFileName];
    return self;
}

@end
