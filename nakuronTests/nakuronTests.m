//
//  nakuronTests.m
//  nakuronTests
//
//  Created by dai on 11/10/25.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "nakuronTests.h"
#import "Lib.h"

@implementation nakuronTests

- (void)setUp
{
    [super setUp];
    
    hash = [[Xor128 alloc] initWithSeed:442410386];
}

- (void)tearDown
{
    [hash release];
    hash = nil;
    
    [super tearDown];
}

- (void)testExample
{
    STAssertEquals([hash getInt], 1135931561, @"First int.");
    STAssertEquals([hash getInt], 71737415, @"Second int.");
    STAssertEquals([hash getInt], 168295657, @"Third int");
    STAssertEquals([hash getInt], 1704634894, @"Fourth int");
    STAssertEquals([hash getInt], 30355372, @"Fifth int");
}

@end
