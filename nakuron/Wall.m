//
//  Wall.m
//  nakuron
//

#import "Wall.h"

@implementation Wall

-(bool)waitFor:(Piece*)target _self:(Piece*)_self {
  return false;
}

-(NSString*)toString {
  return @"Wall";
}

-(NSString*)getImageFilneName {
  return imageFileName;
}

-(PieceBody*)init {
  imageFileName = @"wall.png";
  return self;
}

@end
