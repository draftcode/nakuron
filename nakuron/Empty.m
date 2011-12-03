//
//  Empty.m
//  nakuron
//

#import "Empty.h"

@implementation Empty

-(bool)waitFor:(Ball*)b {
    b = [self copy];
    return true;
}

-(PieceBody*)moveTo:(PieceBody *)target {
    return nil;
}

-(NSString*)toString {
    return @"Emp";
}

-(NSString*)getImageFilneName {
    return imageFileName;
}

-(PieceBody*)init {
    imageFileName = @"empty.png";
    return self;
}

@end
