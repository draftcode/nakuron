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

-(Piece*)initWithColor:(Color*)c;

@end
