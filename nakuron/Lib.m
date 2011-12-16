//
//  Lib.m
//  nakuron
//
//  Created by Daisuke Matsumoto on 11/12/17.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "Lib.h"

@implementation Xor128

-(Xor128*)initWithSeed:(int)seed {
    x = 123456789, y = 362436069, z = 521288629, w = seed;
    return self;
}

-(int)getInt {
    int t = (x^(x<<11));
    x=y;y=z;z=w;
    return ( w=(w^((w>>19)&0x1FFF))^(t^((t>>8)&0xFFFFFF)) ) & 0x7FFFFFFF;
}

@end

@implementation Lib

@end
