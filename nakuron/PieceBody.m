//
//  PieceBody.m
//  nakuron
//

#import "PieceBody.h"
#import "ProgrammingException.h"

@implementation PieceBody

-(PieceBody*)moveTo:(PieceBody *)target {
    [ProgrammingException error:@"PieceBody.moveToをオーバーライドしていない"];
    return nil;
}

-(bool)waitFor:(Ball*)b {
    [ProgrammingException error:@"PieceBody.waitForをオーバーライドしていない"];
    return false;
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
