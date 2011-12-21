//
//  nakuronViewController.h
//  nakuron
//

#import <UIKit/UIKit.h>

@class Board;

@interface nakuronViewController : UIViewController {
@private
  int seed;
  Board *board;
  NSArray *colors;
  UITextField *seedField;

  UIButton *leftButton, *upButton, *downButton, *rightButton;
}

-(void)initBoard;
-(void)showFeeds;
-(void)showCells;
-(void)showButtons;
-(void)showMap;

@end
