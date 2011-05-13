#import "Photo.h"

/****************************************************************************/
//Extension class
@interface Photo (){
  //We can add ivars
  int newVariable;
}
//We can add properties 
@property (nonatomic, assign) int newVariable;

//Adding private methods. The compiler validates these.
+ (NSString*) defaultCaption;
- (void) logPhotographer;
@end


/****************************************************************************/
//Category class. No ivars allowed
@interface Photo (Private)
//Adding private methods. The compiler DOESN'T enforce it.
- (NSString*) privateCaption;
@end

@implementation Photo (Private)
////If we comment it the respondsToSselector returns NO!! 
- (NSString*) privateCaption {
	return @"Untitled Photo";
}
@end


/****************************************************************************/
@implementation Photo

@synthesize caption;
@synthesize photographer;
@synthesize newVariable;

- (id) init {
  
  if ( (self = [super init]) ) {
    self.caption = @"Default Caption";
    self.photographer = @"Default Photographer";
  }
  
  return self;
}

#pragma mark Class Methods
+ (Photo*) photoWithCaption:(NSString*) newCaption andPhotographer:(NSString*) newPhotographer {
  
  Photo* newPhoto = [[Photo alloc] init];
  newPhoto.caption = newCaption;
  newPhoto.photographer = newPhotographer;
  return [newPhoto autorelease];
}

#pragma mark Protocol Methods
- (NSString *) title { 
  return self.caption;
}

- (NSString *) fileName {    
  return [self.caption stringByAppendingPathExtension:@"jpg"];
}

- (NSString *) summary {    
  return [NSString stringWithFormat:
          @"'%@' by %@", self.caption, self.photographer];
}

#pragma mark Private Methods
+ (NSString*) defaultCaption {
	return @"Untitled Photo";
}

- (void) logPhotographer {
  NSLog(@"Photographer: %@", photographer);
}

- (void) dealloc {
  
  self.caption = nil;
  self.photographer = nil;
  [super dealloc];
}

@end