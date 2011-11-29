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
    NSMutableArray *colors;
}

+(CGFloat)getScreenWidth;
+(CGFloat)getScreenHeight;

-(void)show;
-(void)showCells;

@end
