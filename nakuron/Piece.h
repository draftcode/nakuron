//
//  Piece.h
//  nakuron
//

#import <Foundation/Foundation.h>
#import "Color.h"

@class Ball;

@interface Piece : NSObject {
@protected
    NSString *imageFileName;
    UIImage *image;
@private
    UIImageView *imgv;
}

-(bool)waitFor:(Ball*)b;
-(Piece*)moveTo:(Piece*)target;

-(NSString*)toString;
-(UIImage*)getImage;
-(UIImageView*)getImageV;
-(void)setImage:(UIImage*)img;
-(void)setFrame:(CGRect)frame;

@end
