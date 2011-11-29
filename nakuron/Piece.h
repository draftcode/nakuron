//
//  Piece.h
//  nakuron
//

#import <Foundation/Foundation.h>
#import "Color.h"

@interface Piece : NSObject {
@protected
    NSString *imageFileName;
    UIImage *image;
@private
    UIImageView *imgv;
}

-(UIImage*)getImage;
-(UIImageView*)getImageV;
-(void)setImage:(UIImage*)img;
-(void)setFrame:(CGRect)frame;

@end
