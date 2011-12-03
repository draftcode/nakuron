//
//  PieceBody.h
//  nakuron
//

#import <Foundation/Foundation.h>

@class Ball;

@interface PieceBody : NSObject {
@protected
    NSString *imageFileName;
}

-(bool)waitFor:(Ball*)b;
-(PieceBody*)moveTo:(PieceBody*)target;
-(NSString*)toString;
-(NSString*)getImageFilneName;

@end
