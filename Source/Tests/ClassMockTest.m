//
//  OCMockito - ClassMockTest.m
//  Copyright 2011 Jonathan M. Reid. See LICENSE.txt
//

#define MOCKITO_SHORTHAND
#import "OCMockito.h"

	// Test support
#import <SenTestingKit/SenTestingKit.h>

#define HC_SHORTHAND
#if TARGET_OS_MAC
    #import <OCHamcrest/OCHamcrest.h>
#else
    #import <OCHamcrestIOS/OCHamcrestIOS.h>
#endif


@interface ClassMockTest : SenTestCase
@end


@implementation ClassMockTest

- (void)testMockShouldAnswerSameMethodSignatureForSelectorAsRealObject
{
	// set up
    NSString *mockString = mock([NSString class]);
    NSString *realString = [NSString string];
    SEL selector = @selector(rangeOfString:options:);
    
	// exercise
    NSMethodSignature *signature = [mockString methodSignatureForSelector:selector];
    
    // verify
    assertThat(signature, is(equalTo([realString methodSignatureForSelector:selector])));
}


- (void)testMockShouldRespondToKnownSelector
{
	// set up
    NSString *mockString = mock([NSString class]);
    
    // verify
    STAssertTrue([mockString respondsToSelector:@selector(substringFromIndex:)], nil);
}


- (void)testMockShouldNotRespondToUnknownSelector
{
	// set up
    NSString *mockString = mock([NSString class]);
    
    // verify
    STAssertFalse([mockString respondsToSelector:@selector(removeAllObjects)], nil);
}

@end
