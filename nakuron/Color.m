//
//  Color.m
//  nakuron
//

#import "Color.h"

@implementation Color

-(void)dealloc {
    [name release];
    [super dealloc];
}

-(id)initWithColorName:(NSString*)n {
    name = [n copy];
    return self;
}

-(id)getName {
    return name;
}

@end
