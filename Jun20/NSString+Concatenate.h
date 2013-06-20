//
//  NSString+Concatenate.h
//  Jun20
//
//  Created by david morton on 6/19/13.
//  Copyright (c) 2013 David Morton Enterprises. All rights reserved.
//
/*
#import <Foundation/Foundation.h>

@interface NSString (Concatenate)

@end
*/

#import <Foundation/Foundation.h>

@interface NSString (Concatenate)

+ (NSString *)concatenateStrings:(NSString *)firstString, ... NS_REQUIRES_NIL_TERMINATION;

@end
