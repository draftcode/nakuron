//
//  Ball.h
//  nakuron
//

#import "PieceBody.h"
@class Color;

@interface Ball : PieceBody

+(Ball*)ballWithColor:(Color*)c;
-(Ball*)initWithColor:(Color*)c;

@end
