//
//  Piece.h
//  nakuron
//

#import <Foundation/Foundation.h>
#import "Color.h"

@interface Piece : NSObject {
@private
    UIImageView *imgc;
}

-(id)getImage;

@end
