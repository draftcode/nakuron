//
//  Empty.m
//  nakuron
//

#import "Empty.h"
#import "Piece.h"

@implementation Empty

+(Empty*)empty {
  return [[[Empty alloc] init] autorelease];
}

-(bool)waitFor:(Piece*)target _self:(Piece*)_self {
  // target の body は Ball のはず
  [_self setBody:target.body];
  return true;
}

-(bool)canWaitFor {
  return true;
}

-(NSString*)description {
  return @"Emp";
}

-(Empty*)init {
  self = (Empty*)[super initWithColor:nil
                     andImageFileName:@"empty.png"];
  return self;
}

@end
