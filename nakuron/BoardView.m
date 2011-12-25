//
//  BoardView.m
//  nakuron
//
//  Created by Masaya Suzuki on 11/12/22.
//  Copyright 2011年 Tokyo Institute of Technology. All rights reserved.
//

#import "BoardView.h"
#import "Board.h"
#import <QuartzCore/QuartzCore.h>

@interface BoardView()
- (void)addCellsSubView;
@end

@implementation BoardView
@synthesize colors;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void)dealloc
{
    [board release];
    board = nil;
    [colors release];
    colors = nil;
    [boardImages release];
    boardImages = nil;
    [super dealloc];
}

- (Board*)board
{
    return board;
}

- (void)setBoard:(Board *)aBoard
{
    [aBoard retain];
    
    [board removeObserver:self];
    [board release];
    
    board = aBoard;
    [board addObserver:self];
    
    for (UIView *subview in self.subviews) {
        [subview removeFromSuperview];
    }
    
    [boardImages release];
    boardImages = nil;
    
    [self addCellsSubView];
}

- (void)addCellsSubView
{
    if (board != nil) {
        CGRect rect = [self frame];
        int boardSize = board.boardSize;
        double cellHeight = rect.size.height / (boardSize+2);
        double cellWidth = rect.size.width / (boardSize+2);
        
        boardImages = [[NSMutableDictionary dictionaryWithCapacity:boardSize*boardSize] retain];
        for (int y = 0; y < boardSize; y++) {
            for (int x = 0; x < boardSize; x++) {
                int cellState = [board getStateAtRow:y Col:x];
                if (cellState != -1) {
                    CGRect frame = CGRectMake((x+1)*cellWidth,
                                              (y+1)*cellHeight,
                                              cellWidth,
                                              cellHeight);
                    UIColor *color = nil;
                    if (cellState == 0) {
                        color = [UIColor blackColor];
                    } else {
                        color = [colors objectAtIndex:cellState-1];
                    }
                    
                    UIImageView *image = [[UIImageView alloc] initWithFrame:frame];
                    [image setBackgroundColor:color];
                    [self addSubview:image];
                    [boardImages setObject:image forKey:[NSString stringWithFormat:@"%d,%d", x, y]];
                    [image release];
                }
            }
        }
        
        Direction dirs[] = { UP, RIGHT, DOWN, LEFT };
        int xBegin[] = { 1, boardSize+1, 1, 0 };
        int yBegin[] = { 0, 1, boardSize+1, 1 };
        int dx[] = { 1, 0, 1, 0 };
        int dy[] = { 0, 1, 0, 1 };
        for (int dirIdx = 0; dirIdx < 4; dirIdx++) {
            for (int i = 0; i < boardSize; i++) {
                int cellState = [board getHoleAtDirection:dirs[dirIdx] Index:i];
                CGRect frame = CGRectMake((xBegin[dirIdx]+dx[dirIdx]*i)*cellWidth,
                                          (yBegin[dirIdx]+dy[dirIdx]*i)*cellHeight,
                                          cellWidth,
                                          cellHeight);
                UIColor *color = nil;
                if (cellState == 0) {
                    color = [UIColor blackColor];
                } else {
                    color = [colors objectAtIndex:cellState-1];
                }
                
                UIImageView *image = [[UIImageView alloc] initWithFrame:frame];
                [image setBackgroundColor:color];
                [self addSubview:image];
                [image release];
            }
        }
    }
}

- (void)moveObjectFromRow:(int)fromY Col:(int)fromX ToRow:(int)toY Col:(int)toX
{
    NSString *key = [NSString stringWithFormat:@"%d,%d", fromX, fromY];
    UIImageView *image = [boardImages objectForKey:key];

    int boardSize = board.boardSize;
    CGRect rect = [self frame];
    double cellHeight = rect.size.height / (boardSize+2);
    double cellWidth = rect.size.width / (boardSize+2);
    CGRect frame = CGRectMake((toX+1)*cellWidth,
                              (toY+1)*cellHeight,
                              cellWidth,
                              cellHeight);
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationDuration:0.25*(abs(fromY-toY)+abs(fromX-toX))];
    
    image.Frame = frame;
    
    [UIView commitAnimations];

    [boardImages setObject:image forKey:[NSString stringWithFormat:@"%d,%d", toX, toY]];
    [boardImages removeObjectForKey:key];
}
@end
