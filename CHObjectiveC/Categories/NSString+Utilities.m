#import "NSString+Utilities.h"
            
@implementation NSString (Utilities)

- (BOOL) isURL {
  
  if ( [self hasPrefix:@"http://"] )
    return YES;
  else
    return NO;
}

@end