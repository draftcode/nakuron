//
//  nakuronAppDelegate.h
//  nakuron
//
//  Created by dai on 11/10/25.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class nakuronViewController;

@interface nakuronAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet nakuronViewController *viewController;

@end
