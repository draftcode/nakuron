//
//  Color.h
//  nakuron
//

#import <Foundation/Foundation.h>

@interface Color : NSObject {
@private
  NSString* name;
}

@property (nonatomic, readonly) NSString* name;

+(Color*)colorWithColorName:(NSString*)n;
-(Color*)initWithColorName:(NSString*)n;

@end
