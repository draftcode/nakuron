//
//  Hole.h
//  nakuron
//

#import "Piece.h"
#import "Color.h"

@interface Hole : Piece {

@private
    Color *color;
}

-(Color*)getColor;
-(Piece*)initWithColor:(Color*)c;

@end
