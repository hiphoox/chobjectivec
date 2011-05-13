//
//  IconViewInfo.h
//  CHObjectiveC
//
//  Created by Norberto Ortigoza on 08/05/11.
//  Copyright 2011 Raku Studio. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol IconViewInfo <NSObject>

- (NSString *) title;
- (NSString *) fileName;  
- (NSString *) summary;

@optional
- (NSString *) author;

@end
