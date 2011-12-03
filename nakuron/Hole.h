//
//  Hole.h
//  nakuron
//

#import "PieceBody.h"
#import "Color.h"

@interface Hole : PieceBody {

@private
    Color *color;
}

-(Color*)getColor;
-(PieceBody*)initWithColor:(Color*)c;

@end
