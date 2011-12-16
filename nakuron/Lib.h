//
//  Lib.h
//  nakuron
//
//  Created by Daisuke Matsumoto on 11/12/17.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
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
