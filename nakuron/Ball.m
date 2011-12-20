//
//  Ball.m
//  nakuron
//

#import "Ball.h"
#import "Color.h"

@implementation Ball

+(Ball*)ballWithColor:(Color *)c {
  return [[[Ball alloc] initWithColor:c] autorelease];
}

-(bool)waitFor:(Piece*)target _self:(Piece*)_self {
  return false;
}

-(bool)canMove {
  return true;
}

-(NSString*)description {
  return self.color.name;
}

-(Ball*)initWithColor:(Color*)c {
  self = (Ball*)[super initWithColor:c
                    andImageFileName:[NSString stringWithFormat:@"b%@.png", c.name]];
  return self;
}

@end
