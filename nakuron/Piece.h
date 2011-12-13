//
//  Piece.h
//  nakuron
//

#import <Foundation/Foundation.h>
#import "Color.h"
#import "PieceBody.h"

@class Ball;

@interface Piece : NSObject {
@private
    UIImage *image;
    UIImageView *imgv;
    PieceBody *body;
}

-(Piece*)moveTo:(Piece*)target;
-(bool)waitFor:(Piece*)p;
-(bool)canWaitFor;
-(NSString*)toString;
-(UIImage*)getImage;
-(UIImageView*)getImageV;
-(void)setImage:(UIImage*)img;
-(void)updateImage;
-(void)setFrame:(CGRect)frame;
-(PieceBody*)getBody;
-(void)setBody:(PieceBody*)b;

@end
