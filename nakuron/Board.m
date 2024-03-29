//
//  Board.m
//  nakuron
//

#import "Board.h"
#import "Lib.h"

@implementation Board

// ``rows`` and ``holes`` array hold ``NSNumber`` or ``NSNull``.
// NSNumber(0) means Wall, NSNumber(1..) means Ball or Hole, and NSNull means Empty.
// Ball's number represents the kind of the ball.

- (id)initWithSize:(int)size seed:(int)seed colors:(int)colors
{
    self = [super init];
    if (self) {
        int hole = 80; int wall = 20;
        
        boardSize = size;
        numberOfColors = colors;
        Xor128 *hash = [Xor128 xor128WithSeed:seed];
        
        rows = [[NSMutableArray arrayWithCapacity:boardSize] retain];
        holes = [[NSMutableArray arrayWithCapacity:4] retain];
        for (int i = 0; i < 4; i++) {
            [holes addObject:[NSMutableArray arrayWithCapacity:boardSize]];
        }
        
        for (int y = 0; y < boardSize+2; y++) {
            if (y == 0 || y == boardSize+1) {
                NSMutableArray* row = [holes objectAtIndex:(y==0)?UP:DOWN];
                [hash getInt];
                [hash getInt];
                for (int x = 0; x < boardSize; x++) {
                    if ([hash getInt] % 100 < hole) {
                        [row addObject:[NSNumber numberWithInt:1+[hash getInt] % numberOfColors]];
                    } else {
                        [row addObject:[NSNumber numberWithInt:0]];
                    }
                }
                [hash getInt];
                [hash getInt];
            } else {
                if ([hash getInt] % 100 < hole) {
                    [[holes objectAtIndex:LEFT] addObject:[NSNumber numberWithInt:1+[hash getInt] % numberOfColors]];
                } else {
                    [[holes objectAtIndex:LEFT] addObject:[NSNumber numberWithInt:0]];
                }
                
                NSMutableArray* row = [NSMutableArray arrayWithCapacity:boardSize];
                for (int x = 0; x < boardSize; x++) {
                    if ([hash getInt] % 100 < wall) {
                        [row addObject:[NSNumber numberWithInt:0]];
                    } else {
                        [row addObject:[NSNumber numberWithInt:1+[hash getInt] % numberOfColors]];
                    }
                }
                [rows addObject:row];

                if ([hash getInt] % 100 < hole) {
                    [[holes objectAtIndex:RIGHT] addObject:[NSNumber numberWithInt:1+[hash getInt] % numberOfColors]];
                } else {
                    [[holes objectAtIndex:RIGHT] addObject:[NSNumber numberWithInt:0]];
                }            
            }
        }
                
        observers = [[NSMutableSet alloc] init];
    }
    
    return self;
}

- (void)dealloc
{
    [holes release];
    [rows release];
    [observers release];
    [super dealloc];
}

#pragma mark - Getter/Setter
@synthesize boardSize;
@synthesize ballColors;

// getStateAtRow and getHoleAtDirection returns one of following:
//
// -1 ... Empty
//  0 ... Wall
// otherwise ... Ball (and its number is the kind of the ball or the hole.

- (int)getStateAtRow:(NSUInteger)y Col:(NSUInteger)x
{
    id obj = [[rows objectAtIndex:y] objectAtIndex:x];
    if (obj == [NSNull null]) {
        return -1;
    } else {
        return [obj intValue];
    }
}

- (void)setState:(int)state Row:(NSUInteger)y Col:(NSUInteger)x
{
    id obj = nil;
    if (state == -1) {
        obj = [NSNull null];
    } else {
        obj = [NSNumber numberWithInt:state];
    }
    NSMutableArray *row = [rows objectAtIndex:y];
    [row replaceObjectAtIndex:x withObject:obj];
}

- (int)getHoleAtDirection:(Direction)dir Index:(NSUInteger)x
{
    return [[[holes objectAtIndex:dir] objectAtIndex:x] intValue];
}

- (void)addObserver:(NSObject *)observer
{
    [observers addObject:observer];
}

- (void)removeObserver:(NSObject *)observer
{
    [observers removeObject:observer];
}

#pragma mark - Movements

- (void)moveObjectFromRow:(int)fromY Col:(int)fromX ToRow:(int)toY Col:(int)toX Scored:(bool)scored
{
    int state = [self getStateAtRow:fromY Col:fromX];
    
    if (toY != -1 && toY != boardSize && toX != -1 && toX != boardSize) {
        [self setState:state Row:toY Col:toX];
    }
    [self setState:-1 Row:fromY Col:fromX];
    
    for (id observer in observers) {
        if ([observer respondsToSelector:@selector(moveObjectFromRow:Col:ToRow:Col:Scored:)]) {
            [observer moveObjectFromRow:fromY Col:fromX ToRow:toY Col:toX Scored:scored];
        }
    }
}

- (void)move:(Direction)dir
{
    int start, end, dx, dy;
    switch (dir) {
        case LEFT:  start = 0; end = boardSize; dy = 0; dx = 1; break;
        case UP:    start = 0; end = boardSize; dy = 1; dx = 0; break;
        case RIGHT: start = boardSize-1; end = -1; dy = 0; dx = -1; break;
        case DOWN:  start = boardSize-1; end = -1; dy = -1; dx = 0; break;
    }
    if (dx == 0) {
        // 縦方向
        for (int x = 0; x < boardSize; x++) {
            for (int y = start; y != end; y += dy) {
                int state = [self getStateAtRow:y Col:x];
                if (state != -1 && state != 0) {
                    int collideIdx = y - dy;
                    for (; 0 <= collideIdx && collideIdx < boardSize; collideIdx -= dy) {
                        int collideState = [self getStateAtRow:collideIdx Col:x];
                        if (collideState != -1) break;
                    }
                    
                    bool scored = NO;
                    int moveTo = -2;
                    if (collideIdx == -1 || collideIdx == boardSize) {
                        int holeState = [self getHoleAtDirection:dir Index:x];
                        if (holeState == 0) {
                            moveTo = collideIdx + dy;
                        } else {
                            scored = (state == holeState);
                            moveTo = collideIdx;
                        }
                    } else {
                        moveTo = collideIdx + dy;
                    }
                    
                    if (moveTo != y) {
                        [self moveObjectFromRow:y Col:x ToRow:moveTo Col:x Scored:scored];
                    }

                }
            }
        }
    } else {
        // 横方向
        for (int y = 0; y < boardSize; y++) {
            for (int x = start; x != end; x += dx) {
                int state = [self getStateAtRow:y Col:x];
                if (state != -1 && state != 0) {
                    int collideIdx = x - dx;
                    for (; 0 <= collideIdx && collideIdx < boardSize; collideIdx -= dx) {
                        int collideState = [self getStateAtRow:y Col:collideIdx];
                        if (collideState != -1) break;
                    }
                    
                    BOOL scored = NO;
                    int moveTo = -2;
                    if (collideIdx == -1 || collideIdx == boardSize) {
                        int holeState = [self getHoleAtDirection:dir Index:y];
                        if (holeState == 0) {
                            moveTo = collideIdx + dx;
                        } else {
                            scored = (state == holeState);
                            moveTo = collideIdx;
                        }
                    } else {
                        moveTo = collideIdx + dx;
                    }
                    
                    if (moveTo != x) {
                        [self moveObjectFromRow:y Col:x ToRow:y Col:moveTo Scored:scored];
                    }
                    
                }
            }
        }
    }

}

@end
