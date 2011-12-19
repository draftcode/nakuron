//
//  Hole.m
//  nakuron
//

#import "Hole.h"
#import "ProgrammingException.h"
#import "Piece.h"

@implementation Hole

-(void)dealloc {
//    [color release];
    [super dealloc];
}

-(bool)waitFor:(Piece*)target _self:(Piece*)_self {
    // target の body は Ball のはず
    Color *c;
    if (((c = [[target getBody] getColor]) != nil) && (c == [[_self getBody] getColor])) {
        // ここでスコアアップの処理とか。効果音？
        NSString *str = [NSString stringWithFormat:@"%@,同じ色の穴に落ちた\n",[c getName]];
        NSLog(@"%@", str);
        [[target getBody] release];
    } else {
        // 効果音？
    }
    return true;
}

-(bool)canWaitFor {
    return true;
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
