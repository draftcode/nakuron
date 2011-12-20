//
//  ProgrammingException.m
//  nakuron

#import "ProgrammingException.h"

@implementation ProgrammingException

+(void)error:(NSString*)message {
  NSException *exception = [NSException
                            exceptionWithName:@"ProgrammingException"
                            reason:message
                            userInfo:nil];
  @throw exception;
  exit(127);
}

@end
