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
#import <AudioToolbox/AudioServices.h>

@interface CircleView : UIView {
    UIColor *color;
}
@property (readwrite,retain,nonatomic) UIColor *color;
@end

@implementation CircleView
@synthesize color;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        color = [[UIColor blackColor] retain];
    }
    return self;
}

- (void)dealloc
{
    [color release];
    color = nil;
    [super dealloc];
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillEllipseInRect(context, rect);
}

@end

@interface BoardView()
- (void)addCellsSubView;
@end

CGRect makeCellRect(double width, double height, int x, int y) {
    return CGRectMake(x * width + 1, y * height + 1, width - 2, height - 2);
}

@implementation BoardView
@synthesize colors;

- (void)dealloc
{
    [board release];
    board = nil;
    [colors release];
    colors = nil;
    [boardObjects release];
    boardObjects = nil;
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
    
    [boardObjects release];
    boardObjects = nil;
    
    [self addCellsSubView];
}

- (void)addCellsSubView
{
    if (board != nil) {
        CGRect rect = [self frame];
        int boardSize = board.boardSize;
        double cellHeight = rect.size.height / (boardSize+2);
        double cellWidth = rect.size.width / (boardSize+2);
        
        boardObjects = [[NSMutableDictionary dictionaryWithCapacity:boardSize*boardSize] retain];
        for (int y = 0; y < boardSize; y++) {
            for (int x = 0; x < boardSize; x++) {
                int cellState = [board getStateAtRow:y Col:x];
                if (cellState != -1) {
                    CGRect frame = makeCellRect(cellWidth, cellHeight, x+1, y+1);
                    UIView *view = nil;
                    if (cellState == 0) {
                        view = [[UIView alloc] initWithFrame:frame];
                        [view setBackgroundColor:[UIColor blackColor]];
                    } else {
                        CircleView *circleView = [[CircleView alloc] initWithFrame:frame];
                        circleView.color = [colors objectAtIndex:cellState-1];
                        circleView.backgroundColor = [UIColor clearColor];
                        view = circleView;
                    }
                    
                    [self addSubview:view];
                    [boardObjects setObject:view forKey:[NSString stringWithFormat:@"%d,%d", x, y]];
                    [view release];
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
                CGRect frame = makeCellRect(cellWidth, cellHeight,
                                            xBegin[dirIdx]+dx[dirIdx]*i,
                                            yBegin[dirIdx]+dy[dirIdx]*i);
                UIColor *color = nil;
                if (cellState == 0) {
                    color = [UIColor blackColor];
                } else {
                    color = [colors objectAtIndex:cellState-1];
                }
                
                UIView *view = [[UIView alloc] initWithFrame:frame];
                [view setBackgroundColor:color];
                [self addSubview:view];
                [view release];
            }
        }
    }
}

- (void)moveObjectFromRow:(int)fromY Col:(int)fromX ToRow:(int)toY Col:(int)toX
{
    NSString *key = [NSString stringWithFormat:@"%d,%d", fromX, fromY];
    UIView *view = [boardObjects objectForKey:key];

    int boardSize = board.boardSize;
    CGRect rect = [self frame];
    double cellHeight = rect.size.height / (boardSize+2);
    double cellWidth = rect.size.width / (boardSize+2);
    
    CGRect frame = makeCellRect(cellWidth, cellHeight, toX+1, toY+1);    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:0.07*(abs(fromY-toY)+abs(fromX-toX))];
    view.Frame = frame;
    [UIView commitAnimations];
    AudioServicesPlaySystemSound(1003);

    [boardObjects setObject:view forKey:[NSString stringWithFormat:@"%d,%d", toX, toY]];
    [boardObjects removeObjectForKey:key];
}
@end
