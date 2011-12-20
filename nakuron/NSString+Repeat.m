//
//  NSString+Repeat.m
//  nakuron
//


#import "NSString+Repeat.h"


@implementation NSString (Repeat)

-(NSString *)repeatTimes:(NSUInteger)times {
  NSMutableString* s = [NSMutableString stringWithCapacity:[self length] * times];
  for (NSUInteger i = 0; i < times; ++i) {
    [s appendString:self];
  }
  return s;
}

@end
