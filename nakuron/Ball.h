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

-(Piece*)initWithColor:(Color*)c;

@end
