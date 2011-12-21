//
//  PieceBody.m
//  nakuron
//

#import "PieceBody.h"


@implementation PieceBody

@synthesize color;
@synthesize imageFileName;

-(void)dealloc {
  [color release];
  [imageFileName release];
  [super dealloc];
}

-(PieceBody*)initWithColor:(Color *)aColor
          andImageFileName:(NSString *)anImageFileName {
  self = [super init];
  if (self) {
    color = [aColor retain];
    imageFileName = [anImageFileName copy];
  }
  return self;
}

-(bool)waitFor:(Piece*)target _self:(Piece*)_self {
  return false;
}

-(bool)canWaitFor {
  return false;
}

-(bool)canMove {
  return false;
}

@end
