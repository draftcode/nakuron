//
//  Hole.m
//  nakuron
//

#import "Hole.h"

@implementation Hole

-(Piece*)initWithColor:(Color*)c {
    color = c;
    imageFileName = [[NSString alloc] initWithFormat:@"h%@.png",[c getName]];
    image = [UIImage imageNamed:imageFileName];
    return self;
}

@end
