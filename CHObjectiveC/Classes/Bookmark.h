//
//  Bookmark.h
//  CHObjectiveC
//
//  Created by Norberto Ortigoza on 08/05/11.
//  Copyright 2011 Raku Studio. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "IconViewInfo.h"    

@interface Bookmark : NSObject <IconViewInfo> {
@private
    
}

+ (id) bookmark;

@property (nonatomic, retain) NSString *caption;
@property (nonatomic, retain) NSString *url;
@property (nonatomic, retain) NSString *siteName;

@end
