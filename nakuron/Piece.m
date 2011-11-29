//
//  Piece.m
//  nakuron
//

#import "Piece.h"
#import "ProgrammingException.h"

@implementation Piece

-(id)getImage {
    [ProgrammingException error:@"Piece.getImageがオーバーライドされていません"];
    return nil;
}

@end
