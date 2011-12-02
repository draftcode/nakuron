//
//  Hole.m
//  nakuron
//

#import "Hole.h"
#import "ProgrammingException.h"

@implementation Hole

-(bool)waitFor:(Ball *)b {
    Color *c;
    if (((c = [b getColor]) != nil) && (c == [self getColor])) {
        // ここでスコアアップの処理とか。効果音？
        NSLog(@"同じ色の穴に落ちた");
    } else {
        // 効果音？
    }
    return true;
}

-(bool)moveTo:(Piece *)target {
    [ProgrammingException error:@"Hole.moveToが呼ばれたけど、そんなはずはない！"];
    return false;
}

-(Piece*)initWithColor:(Color*)c {
    color = c;
    imageFileName = [[NSString alloc] initWithFormat:@"h%@.png",[c getName]];
    image = [UIImage imageNamed:imageFileName];
    return self;
}

-(Color*)getColor {
    return color;
}

@end
