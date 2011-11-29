//
//  Color.h
//  nakuron
//

#import <Foundation/Foundation.h>

@interface Color : NSObject {
@private
    NSString* name;
}

-(id)initWithColorName:(NSString*)n;

-(id)getName;

@end
