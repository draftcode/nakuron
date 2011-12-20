//
//  PieceBody.h
//  nakuron
//

#import <Foundation/Foundation.h>
//#import "Piece.h"
#import "Color.h"

@class Ball;
@class Piece;

@interface PieceBody : NSObject {
@protected
  NSString *imageFileName;
}

-(bool)waitFor:(Piece*)target _self:(Piece*)_self;
-(bool)canWaitFor;
-(bool)canMove;
-(Color*)getColor;
-(NSString*)toString;
-(NSString*)getImageFilneName;

@end
