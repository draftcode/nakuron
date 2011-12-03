//
//  Piece.m
//  nakuron
//

#import "Piece.h"
#import "ProgrammingException.h"

@implementation Piece

-(NSString*)toString {
    return [body toString];
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
        [ProgrammingException error:@"Piece.imageを上書きしていない"];
        return nil;
    }
}

-(void)updateImage {
    imgv.image = [UIImage imageNamed:[body getImageFilneName]];
}

-(void)setFrame:(CGRect)frame {
    imgv = [[UIImageView alloc] initWithFrame:frame];
}

-(void)setImage:(UIImage *)img {
    imgv.image = img;
}

-(PieceBody*)getBody {
    return body;
}

-(void)setBody:(PieceBody *)b {
    body = b;
}

@end
