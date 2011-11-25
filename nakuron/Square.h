//
//  Square.h
//  nakuron
//

#import <Foundation/Foundation.h>
#import "Ball.h"

@interface Square : NSObject {
@private
    Ball *ball;
}

-(id)init:(Ball*)b;

@end
