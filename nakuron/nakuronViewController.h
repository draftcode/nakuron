//
//  nakuronViewController.h
//  nakuron
//

#import <UIKit/UIKit.h>

@class Board;

@interface nakuronViewController : UIViewController {
@private
    Board *board;
    NSArray *colors;
    UITextField *seedField;
}

-(void)initBoard:(int)seed;
-(void)show;
-(void)showCells;

@end
