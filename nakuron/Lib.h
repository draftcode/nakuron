//
//  Lib.h
//  nakuron
//

#import <Foundation/Foundation.h>

@interface Xor128 : NSObject {
  int x, y, z, w;
}

+ (Xor128*)xor128WithSeed:(int)seed;
- (Xor128*)initWithSeed:(int)seed;
- (int)getInt;


@end
