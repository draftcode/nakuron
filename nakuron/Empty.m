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

-(bool)moveTo:(Piece *)target {
    return false;
}

-(Piece*)init {
    image = [UIImage imageNamed:@"empty.png"];
    return self;
}

@end
