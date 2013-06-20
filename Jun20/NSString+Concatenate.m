//
//  NSString+Concatenate.m
//  Jun20
//
//  Created by david morton on 6/19/13.
//  Copyright (c) 2013 David Morton Enterprises. All rights reserved.
//
/*
#import "NSString+Concatenate.h"

@implementation NSString (Concatenate)

@end
 */

#import "NSString+Concatenate.h"

@implementation NSString (Concatenate)

+ (NSString *)concatenateStrings:(NSString *)firstString, ...
{
	NSMutableString *outputString = [NSMutableString string];
	va_list arguments;
	va_start(arguments, firstString);
	for (NSString *anArgument = firstString; anArgument != nil; anArgument = va_arg(arguments, NSString*)) {
		if ([anArgument isKindOfClass:[NSString class]]) {
			[outputString appendString:anArgument];
		}
	}
	va_end(arguments);
	
	return [NSString stringWithString:outputString];
}

@end
