//
//  Bookmark.m
//  CHObjectiveC
//
//  Created by Norberto Ortigoza on 08/05/11.
//  Copyright 2011 Raku Studio. All rights reserved.
//

#import "Bookmark.h"
#import "Photo.h"

@implementation Bookmark

@synthesize caption;
@synthesize url;
@synthesize siteName;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

+ (id) bookmark{
  return [[[Bookmark alloc] init] autorelease];
}

#pragma mark Protocol Methods
//TODO Comment for demo
- (NSString *) title { 
  return self.caption;
}

- (NSString *) fileName {    
  return [self.caption stringByAppendingPathExtension:@"jpg"];
}

- (NSString *) summary {    
  return [NSString stringWithFormat: @"'%@' by %@", self.caption, self.url];
}

//Forwarding
- (NSMethodSignature *) methodSignatureForSelector:(SEL)aSelector {
  
  NSString* name = NSStringFromSelector( aSelector );
  NSLog( @"-[%@: methodSignatureForSelector: %@]", [self className], name );
  
  if ([Photo instancesRespondToSelector: aSelector])
    return [Photo instanceMethodSignatureForSelector: aSelector];
  
  return [super methodSignatureForSelector: aSelector];
}

- (void) forwardInvocation: (NSInvocation*) invocation {
  
  NSString* name = NSStringFromSelector( invocation.selector );
  NSLog( @"-[%@: forwardInvocation: %@]", [self className], name );
  
  id thePhoto = [[Photo alloc] init];
  NSLog( @"Forwarding '%@' to %@", name, thePhoto );
  [invocation invokeWithTarget: thePhoto];
  [thePhoto release];
}


- (void)dealloc
{
    [super dealloc];
}

@end
