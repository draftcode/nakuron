//
//  Ball.h
//  nakuron
//

#import "Piece.h"
#import "Color.h"

@interface Ball : Piece {
@private
    Color *color;
}

-(Color*)getColor;
-(Piece*)initWithColor:(Color*)c;

@end
