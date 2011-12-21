//
//  Hole.m
//  nakuron
//

#import "Hole.h"
#import "Piece.h"
#import "Color.h"

@implementation Hole

+(Hole*)holeWithColor:(Color *)c {
  return [[[Hole alloc] initWithColor:c] autorelease];
}

-(bool)waitFor:(Piece*)target _self:(Piece*)_self {
  // target の body は Ball のはず
  Color *c = target.body.color;
  if ((c != nil) && (c == _self.body.color)) {
    // ここでスコアアップの処理とか。効果音？
    NSString *str = [NSString stringWithFormat:@"%@,同じ色の穴に落ちた\n", c.name];
    NSLog(@"%@", str);
    // TODO(halwhite): OK??
    // [[target getBody] release];
  } else {
    // 効果音？
  }
  return true;
}

-(bool)canWaitFor {
  return true;
}

-(NSString*)description {
  return [self.color.name capitalizedString];
}

-(Hole*)initWithColor:(Color*)c {
  self = (Hole*)[super initWithColor:c
                    andImageFileName:[NSString stringWithFormat:@"h%@.png", c.name]];
  return self;
}

@end
