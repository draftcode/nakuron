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
        NSString *str = [NSString stringWithFormat:@"%@,同じ色の穴に落ちた\n",[c getName]];
        NSLog(@"%@", str);
    } else {
        // 効果音？
    }
    return true;
}

-(PieceBody*)moveTo:(PieceBody *)target {
    [ProgrammingException error:@"Hole.moveToが呼ばれたけど、そんなはずはない！"];
    return false;
}

-(NSString*)toString {
    return [[color getName] capitalizedString];
}

-(NSString*)getImageFilneName {
    return imageFileName;
}

-(PieceBody*)initWithColor:(Color*)c {
    color = c;
    imageFileName = [[NSString alloc] initWithFormat:@"h%@.png",[c getName]];
    return self;
}

-(Color*)getColor {
    return color;
}

@end
