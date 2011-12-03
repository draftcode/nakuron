//
//  Ball.h
//  nakuron
//

#import "PieceBody.h"
#import "Color.h"

@interface Ball : PieceBody {
@private
    Color *color;
}

-(Color*)getColor;
-(PieceBody*)initWithColor:(Color*)c;

@end
