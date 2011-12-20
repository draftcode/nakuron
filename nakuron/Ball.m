//
//  Ball.m
//  nakuron
//

#import "Ball.h"
#import "Empty.h"

@implementation Ball

-(void)dealloc {
  [color release];
  [imageFileName release];
  [super dealloc];
}

-(bool)waitFor:(Piece*)target _self:(Piece*)_self {
  return false;
}

-(bool)canMove {
  return true;
}

-(NSString*)toString {
  return [color getName];
}

-(NSString*)getImageFilneName {
  return imageFileName;
}

-(Color*)getColor {
  return color;
}

-(PieceBody*)initWithColor:(Color*)c {
  color = [c retain];
  imageFileName = [[NSString alloc] initWithFormat:@"b%@.png",[c getName]];
  return self;
}

@end
