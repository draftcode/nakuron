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

-(Piece*)moveTo:(Piece *)target {
    return nil;
}

-(NSString*)toString {
    return @"Emp";
}

-(Piece*)init {
    imageFileName = @"empty.png";
    image = [UIImage imageNamed:imageFileName];
    return self;
}

@end
