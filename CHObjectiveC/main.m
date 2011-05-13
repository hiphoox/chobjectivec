//
//  main.m
//  CHObjectiveC
//
//  Created by Norberto Ortigoza on 07/05/11.
//  Copyright 2011 Raku Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Photo.h"
#import "NSString+Utilities.h"
#import "Bookmark.h"
#import "MARTNSObject.h"

int main (int argc, const char * argv[])
{

  NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
  
  //Properties
  Photo* photo1 = [[Photo alloc] init];
  
  NSLog( @"photo1 caption: %@", photo1.caption );
  NSLog( @"photo1 photographer: %@", photo1.photographer );
  
  photo1.caption      = @"Overlooking the Golden Gate Bridge";
  photo1.photographer = @"(Your name here)";
  
  NSLog( @"photo1 caption: %@", photo1.caption );
  NSLog( @"photo1 photographer: %@", photo1.photographer );
  
  [photo1 release];
  
  
  //Categories
  NSString* string1 = @"http://cocoabook.com/";
  NSString* string2 = @"Cocoa Book";
  
  if ( [string1 isURL] ) {
    NSLog (@"string1 is a URL");
  }
  
  if ( [string2 isURL] ) {
    NSLog (@"string2 is a URL");
  }

  
  //Class Methods and autorelease
  Photo* photo2  = [Photo photoWithCaption:@"Moffett Field" 
                           andPhotographer:@"Erick Camacho"];
    
  //Instrospection
  NSLog( @"isSubclassOfClass: %d" , [Photo isSubclassOfClass:[NSObject class]] );
  NSLog( @"Class:  %@ "           , [photo2 className] );
  NSLog( @"SuperClass:  %@ "      , [photo2 superclass] );
  NSLog( @"isKindOfClass:  %d "   , [photo2 isKindOfClass:[Photo class]] );
  NSLog( @"isMemberOfClass: %d "  , [photo2 isMemberOfClass:[NSObject class]] );
  NSLog( @"conformsToProtocol: %d", [photo2 conformsToProtocol: @protocol(IconViewInfo)] );
  
  //More Introspection
  // get all subclasses of a class
  NSArray *subclasses = [Photo rt_subclasses];
  for(id subclass in subclasses)
    NSLog(@"%@", subclasses);
  
  // check out the methods on NSString
  NSArray *methods = [Photo rt_methods];
  for(RTMethod *method in methods)
    NSLog(@"%@", method);
  
  // does it have any ivars?
  NSLog(@"%@", [Photo rt_ivars]);

  // does it have any properties?
  NSLog(@"%@", [Photo rt_properties]);

  // does it conforms to any protocols?
  NSLog(@"%@", [Photo rt_protocols]);

  // The real one
  NSLog(@"%@", [photo2 rt_class]);

  
  //Visibility
  //  NSLog( @"photo2 respondsTo defaultCaption: %@", [photo2 defaultCaption] );
  if ([photo2 respondsToSelector: @selector(defaultCaption)]){
    NSLog( @"photo2 respondsTo defaultCaption" );
  }
  if ([photo2 respondsToSelector: @selector(caption)]){
    NSLog( @"photo2 respondsTo caption: %@", photo2.caption );
  }
  if ([photo2 respondsToSelector: @selector(title)]){
    NSLog( @"photo2 respondsTo title: %@", [photo2 title] );
  }
  if ([photo2 respondsToSelector: @selector(isOK)]){
    NSLog( @"photo2 respondsTo isOK %d", (int)[photo2 performSelector:@selector(isOK)] );
  }
  if ([photo2 respondsToSelector: @selector(privateCaption)]){
    //    NSLog( @"photo2 respondsTo privateCaption: %@", [photo2 privateCaption]);
  }  
    

  //Forwarding
  id bookmark = [Bookmark bookmark];
  [bookmark title];
  //[bookmark isOK];
  
  [pool drain];
  return 0;
}

