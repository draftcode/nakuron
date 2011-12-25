//
//  nakuronViewController.h
//  nakuron
//

#import <UIKit/UIKit.h>

@class Board;
@class BoardView;

@interface nakuronViewController : UIViewController {
@private
    int seed;
    Board *board;
    IBOutlet BoardView *boardView;
    IBOutlet UITextField *seedField;
}

- (IBAction)generate:(id)sender;
- (IBAction)up:(id)sender;
- (IBAction)left:(id)sender;
- (IBAction)right:(id)sender;
- (IBAction)down:(id)sender;

@end