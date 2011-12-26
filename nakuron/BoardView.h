//
//  BoardView.h
//  nakuron
//
//  Created by Masaya Suzuki on 11/12/22.
//  Copyright 2011年 Tokyo Institute of Technology. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Board;

@interface BoardView : UIView {
    Board *board;
    NSMutableDictionary *boardObjects;
    NSArray *colors;
}

@property (readwrite,retain) Board *board;
@property (readwrite,retain) NSArray *colors;
@end
