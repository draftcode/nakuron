//
//  Wall.m
//  nakuron
//

#import "Wall.h"

@implementation Wall

+(Wall*)wall {
  return [[[Wall alloc] init] autorelease];
}

-(bool)waitFor:(Piece*)target _self:(Piece*)_self {
  return false;
}

-(NSString*)description {
  return @"Wall";
}

-(Wall*)init {
  self = (Wall*)[super initWithColor:nil
                    andImageFileName:@"wall.png"];
  return self;
}

@end
