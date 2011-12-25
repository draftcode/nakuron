//
//  Board.h
//  nakuron
//

#import <Foundation/Foundation.h>

@class Piece;

typedef enum {
    LEFT,
    UP,
    RIGHT,
    DOWN
} Direction;

@interface Board : NSObject {
    int boardSize;
    int numberOfColors;
    NSMutableArray *holes;
    NSMutableArray *rows;
    NSMutableSet *observers;
}

- (id)initWithSize:(int)size seed:(int)seed colors:(int)colors;

- (int)getStateAtRow:(NSUInteger)y Col:(NSUInteger)x;
- (int)getHoleAtDirection:(Direction)dir Index:(NSUInteger)x;
- (void)addObserver:(NSObject *)observer;
- (void)removeObserver:(NSObject *)observer;

- (void)move:(Direction)dir;

@property (readonly) int boardSize;
@property (readonly) int ballColors;

@end
