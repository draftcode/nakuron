//
//  nakuronViewController.h
//  nakuron
//

#import <UIKit/UIKit.h>

#import "Board.h"
#import "Ball.h"
#import "Color.h"

@interface nakuronViewController : UIViewController {
@private
    Board *board;
    NSArray *colors;
    UITextField *seedField;
    UIButton *seedUpdateButton;
}

-(void)initBoard:(int)seed;
-(void)show;
-(void)showCells;

@end
