//
//  Piece.h
//  nakuron
//

#import <Foundation/Foundation.h>

@class PieceBody;

@interface Piece : NSObject {
@private
  UIImageView *imageView;
  PieceBody* body;
}

@property (nonatomic, retain) PieceBody* body;
@property (nonatomic, readonly) UIImageView* imageView;

+(Piece*)pieceWithFrame:(CGRect)aFrame
                  image:(UIImage*)anImage
              pieceBody:(PieceBody*)aBody;

-(Piece*)initWithFrame:(CGRect)aFrame
                 image:(UIImage*)anImage
             pieceBody:(PieceBody*)aBody;

-(Piece*)moveTo:(Piece*)target;
-(bool)waitFor:(Piece*)p;
-(bool)canWaitFor;
-(void)updateImage;

@end
