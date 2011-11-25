//
//  nakuronViewController.h
//  nakuron
//
//  Created by dai on 11/10/25.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Board.h"
#import "Ball.h"
#import "ColorBall.h"
#import "Display.h"

@interface nakuronViewController : UIViewController {
@private
    Display *display;
}

+(id)getInstance;

@end
