#import <Cocoa/Cocoa.h>
#import "IconViewInfo.h"    

@interface Photo : NSObject <IconViewInfo>

+ (Photo*) photoWithCaption:(NSString*) newCaption andPhotographer:(NSString*) newPhotographer;

@property (nonatomic, retain) NSString *caption;
@property (nonatomic, retain) NSString *photographer;

- (NSString *) title;

@end