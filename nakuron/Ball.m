//
//  Ball.m
//  nakuron
//

#import "Ball.h"

@implementation Ball

-(id)initWithColor:(Color*)c {
    color = c;
    imageFileName = [[NSString alloc] initWithFormat:@"c%@.png",[c getName]];
    image = [UIImage imageNamed:imageFileName];
    return self;
}

-(id)getImage {
//    NSLog(imageFileName);
    return [image copy];
}

@end
