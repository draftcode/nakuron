//
//  Piece.m
//  nakuron
//

#import "Piece.h"
#import "ProgrammingException.h"

@implementation Piece

-(Piece*)moveTo:(Piece *)target {
    [ProgrammingException error:@"Piece.moveToをオーバーライドしていない"];
    return nil;
}

-(bool)waitFor:(Ball*)b {
    [ProgrammingException error:@"Piece.waitForをオーバーライドしていない"];
    return false;
}

-(NSString*)toString {
    [ProgrammingException error:@"Piece.toStringをオーバーライドしていない"];
    return nil;
}

-(UIImageView*)getImageV {
    if (imgv.image) {
        return imgv;
    } else {
        [ProgrammingException error:@"Piece.imageを上書きしていない"];
        return nil;
    }
}

-(UIImage*)getImage {
    if (image) {
        return image;
    } else {
        [ProgrammingException error:@"Piece.imageを上書きしていな"];
        return nil;
    }
}

-(void)setFrame:(CGRect)frame {
    imgv = [[UIImageView alloc] initWithFrame:frame];
}

-(void)setImage:(UIImage *)img {
    imgv.image = img;
}

@end
