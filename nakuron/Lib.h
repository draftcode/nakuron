//
//  Lib.h
//  nakuron
//

#import <Foundation/Foundation.h>

int SCREEN_WIDTH, SCREEN_HEIGHT;

@interface Xor128 : NSObject {
  int x, y, z, w;
}

-(Xor128*)initWithSeed:(int)seed;
-(int)getInt;

@end

@interface Lib : NSObject

@end
