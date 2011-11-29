//
//  nakuronAppDelegate.h
//  nakuron
//

#import <UIKit/UIKit.h>

@class nakuronViewController;

@interface nakuronAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet nakuronViewController *viewController;

@end
