//
//  Wall.m
//  nakuron
//

#import "Wall.h"

@implementation Wall

-(bool)waitFor:(Ball *)b {
    return false;
}

-(PieceBody*)moveTo:(PieceBody*)target {
    return self;
}

-(NSString*)toString {
    return @"Wall";
}

-(NSString*)getImageFilneName {
    return imageFileName;
}

-(PieceBody*)init {
    imageFileName = @"wall.png";
    return self;
}

@end
