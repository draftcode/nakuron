//
//  Board.m
//  nakuron
//

#import "Board.h"

@implementation Board

-(id)initWithSize:(int)size {
    square = [[NSMutableArray alloc] initWithCapacity:size];
    for (int i = 0; i < size; i++) {
        [square insertObject:[[NSMutableArray alloc] initWithCapacity:size] atIndex:i];
        for (int j = 0; j < size; j++) {
            [[square objectAtIndex:i]
             insertObject:@"A"
             atIndex:j];
        }
    }
    return self;
}

@end
