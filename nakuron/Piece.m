//
//  Piece.m
//  nakuron
//

#import "Piece.h"
#import "ProgrammingException.h"
#import "Empty.h"

@implementation Piece

-(void)dealloc {
  [image release];
  [imgv release];
  [body release];
  [super dealloc];
}

-(Piece*)moveTo:(Piece*)p {
  if ([[self getBody] canMove] && [p waitFor:self]) {
    [self setBody:[[Empty alloc] init]];
  }
  return nil;
}

-(bool)waitFor:(Piece*)p {
  return [[self getBody] waitFor:p _self:self];
}

-(bool)canWaitFor {
  return [[self getBody] canWaitFor];
}

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
