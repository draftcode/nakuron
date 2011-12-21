//
//  Hole.h
//  nakuron
//

#import "PieceBody.h"
@class Color;

@interface Hole : PieceBody

+(Hole*)holeWithColor:(Color*)c;
-(Hole*)initWithColor:(Color*)c;

@end
