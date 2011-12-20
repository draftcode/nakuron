//
//  Empty.m
//  nakuron
//

#import "Empty.h"

@implementation Empty

-(bool)waitFor:(Piece*)target _self:(Piece*)_self {
  // target の body は Ball のはず
  [_self setBody:[target getBody]];
  return true;
}

-(bool)canWaitFor {
  return true;
}

-(PieceBody*)moveTo:(Piece *)target {
  return nil;
}

-(NSString*)toString {
  return @"Emp";
}

-(NSString*)getImageFilneName {
  return imageFileName;
}

-(PieceBody*)init {
  imageFileName = @"empty.png";
  return self;
}

@end
