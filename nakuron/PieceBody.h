//
//  PieceBody.h
//  nakuron
//

#import <Foundation/Foundation.h>

@class Piece;
@class Color;

@interface PieceBody : NSObject {
@private
  Color* color;
  NSString* imageFileName;
}

@property (nonatomic, readonly) Color* color;
@property (nonatomic, readonly) NSString* imageFileName;

-(PieceBody*)initWithColor:(Color*)aColor
          andImageFileName:(NSString*)anImageFileName;

-(bool)waitFor:(Piece*)target _self:(Piece*)_self;
-(bool)canWaitFor;
-(bool)canMove;
@end
