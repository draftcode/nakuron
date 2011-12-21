//
//  Color.m
//  nakuron
//

#import "Color.h"

@implementation Color

@synthesize name;

+(Color*)colorWithColorName:(NSString *)n {
  return [[[Color alloc] initWithColorName:n] autorelease];
}

-(void)dealloc {
  [name release];
  [super dealloc];
}

-(Color*)initWithColorName:(NSString*)n {
  self = (Color*)[super init];
  if (self) {
    name = [n copy];
  }
  return self;
}

@end
