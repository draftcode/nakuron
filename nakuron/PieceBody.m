//
//  PieceBody.m
//  nakuron
//

#import "PieceBody.h"
#import "ProgrammingException.h"

@implementation PieceBody

-(bool)waitFor:(Piece*)target _self:(Piece*)_self {
    [ProgrammingException error:@"PieceBody.waitForをオーバーライドしていない"];
    return false;
}

-(bool)canWaitFor {
    return false;
}

-(bool)canMove {
    return false;
}

-(Color*)getColor {
    return nil;
}

-(NSString*)toString {
    [ProgrammingException error:@"PieceBody.toStringをオーバーライドしていない"];
    return nil;
}

-(NSString*)getImageFilneName {
    [ProgrammingException error:@"PieceBody.getImageFileNameをオーバーライドしていない"];
    return nil;
}

@end
