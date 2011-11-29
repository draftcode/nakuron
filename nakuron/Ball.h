//
//  Ball.h
//  nakuron
//

#import "Piece.h"
#import "Color.h"

@interface Ball : Piece {
@private
    Color *color;
    NSString *imageFileName;
    UIImage *image;
}

-(id)initWithColor:(Color*)c;

-(id)getImage;

@end
