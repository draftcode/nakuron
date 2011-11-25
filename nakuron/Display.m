//
//  Display.m
//  nakuron
//

#import "Display.h"

@implementation Display

-(id)init {
    board = [[Board alloc] initWithSize:8];
    return self;
}

-(id)getBoard {
    return board;
}

+(CGFloat)getScreenWidth {
    return [[UIScreen mainScreen] bounds].size.width;
}
+(CGFloat)getScreenHeight {
    return [[UIScreen mainScreen] bounds].size.height;
}

@end
