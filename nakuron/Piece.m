//
//  Piece.m
//  nakuron
//

#import "Piece.h"
#import "ProgrammingException.h"

@implementation Piece

-(UIImageView*)getImageV {
    if (imgv.image) {
        return imgv;
    } else {
        [ProgrammingException error:@"Piece.imageが上書きされていません"];
        return nil;
    }
}

-(UIImage*)getImage {
    if (image) {
        return image;
    } else {
        [ProgrammingException error:@"Piece.imageが上書きされていません"];
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
