//
//  Board.h
//  nakuron
//

#import <Foundation/Foundation.h>

@interface Board : NSObject {
@private
    NSMutableArray *square;
}

-(id)initWithSize:(int)size;

@end
