//
//  Color.m
//  nakuron
//

#import "Color.h"

@implementation Color

-(id)initWithColorName:(NSString*)n {
    name = [n copy];
    return self;
}

-(id)getName {
    return name;
}

@end
