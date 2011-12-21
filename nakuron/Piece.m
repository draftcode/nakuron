//
//  Piece.m
//  nakuron
//

#import "Piece.h"
#import "Empty.h"

@implementation Piece

@synthesize body;
@synthesize imageView;

+(Piece*)pieceWithFrame:(CGRect)aFrame
                  image:(UIImage *)anImage
              pieceBody:(PieceBody *)aBody {
  return [[[Piece alloc] initWithFrame:aFrame
                                 image:anImage
                             pieceBody:aBody] autorelease];
}

-(Piece*)initWithFrame:(CGRect)aFrame
                 image:(UIImage *)anImage
             pieceBody:(PieceBody *)aBody {
  self = [super init];
  if (self) {
    imageView = [[UIImageView alloc] initWithFrame:aFrame];
    imageView.image = anImage;
    body = [aBody retain];
  }
  return self;
}

-(void)dealloc {
  [imageView release];
  [body release];
  [super dealloc];
}

-(Piece*)moveTo:(Piece*)p {
  if ([body canMove] && [p waitFor:self]) {
    self.body = [Empty empty];
  }
  return nil;
}

-(bool)waitFor:(Piece*)p {
  return [body waitFor:p _self:self];
}

-(bool)canWaitFor {
  return [body canWaitFor];
}

-(NSString*)description {
  return [body description];
}

-(void)updateImage {
  imageView.image = [UIImage imageNamed:body.imageFileName];
}

@end
