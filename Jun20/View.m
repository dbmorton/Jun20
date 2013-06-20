//
//  View.m
//  Jun20
//
//  Created by david morton on 6/14/13.
//  Copyright (c) 2013 David Morton Enterprises. All rights reserved.
//

#import "View.h"

#define RED(color)	(((color) >> 2*8 & 0xFF) / 255.0)
#define GREEN(color)	(((color) >> 1*8 & 0xFF) / 255.0)
#define BLUE(color)	(((color) >> 0*8 & 0xFF) / 255.0)

//I'm trying this as one way of many ways to better concatenate strings
//This is a 'Category' - Objective-C allows you to add your own methods to existing classes through categories and class extensions.
//http://developer.apple.com/library/ios/#documentation/cocoa/conceptual/ProgrammingWithObjectiveC/CustomizingExistingClasses/CustomizingExistingClasses.html
//When you wish to extend an existing class by adding behavior that is useful only in certain situations.
//Got from here: http://jeffmenter.wordpress.com/2012/06/06/nsstring-concatenation-category/
#import "NSString+Concatenate.h"

@implementation View

- (id) initWithFrame: (CGRect) frame
{
	self = [super initWithFrame:frame];
	if (self) {
		// Initialization code
		//self.backgroundColor = [UIColor yellowColor];
		//self.backgroundColor = [UIColor colorWithRed: 1.0 green: 0.4 blue: 0.2 alpha: .5];
		unsigned color = 0xFF00FF;	//purple
		self.backgroundColor = [UIColor colorWithRed: RED(color) green: GREEN(color) blue: BLUE(color) alpha: 1.0];
		
		//Keep the size of the view the same,
		//but move the origin to the center of the view.
		CGFloat w = self.bounds.size.width;
		CGFloat h = self.bounds.size.height;
		self.bounds = CGRectMake(-w / 2, -h / 2, w, h);
	}
	return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void) drawRect: (CGRect) rect
{
	
	/*
	// Drawing code
	UIFont *font = [UIFont systemFontOfSize: 2.5*8];
	NSString *string = @"Hello, World!";
	CGPoint point = CGPointMake(0.0, 0.0);
	[string drawAtPoint: point withFont: font];
	*/
	
	//This is equivalent to the above in a single statement
	//[@"Hello, World!" drawAtPoint: CGPointMake(0, 0) withFont: [UIFont systemFontOfSize: 2.5*8]];
	
	//You can use CGPointMake instead of CGPointMake(0, 0)
	//[@"Hello, World!" drawAtPoint: CGPointZero withFont: [UIFont systemFontOfSize: 2.5*8]];
	//CGSizeZero and CGRectZero are similar constants
	
	//trying 50 pixels right and 200 down
	//[@"Hello, World!" drawAtPoint: CGPointMake(50,200) withFont: [UIFont systemFontOfSize: 2.5*8]];

	
	NSString *foreignString =  @"שָׁלוֹם";
	//Needed a smaller font too for later
	UIFont *exampleFont = [UIFont systemFontOfSize: 2.5*8];

	CGSize size = [foreignString sizeWithFont: exampleFont];
	//Put at top center of screen
	CGPoint point = CGPointMake(-size.width / 2, -self.bounds.size.height/2);
	[foreignString drawAtPoint: point withFont: exampleFont];

	
	UIFont *exampleFont2 = [UIFont systemFontOfSize: 2.5*5];
	
	
	
	NSLog(@"%@", [UIFont familyNames]);
	NSLog(@"AEZweddingdings: %@", [UIFont fontNamesForFamilyName:@"AEZweddingdings"] );
	//See more at: http://refactr.com/blog/2012/09/ios-tips-custom-fonts/#sthash.hGzHaxqN.dpuf

	//UIFont *importedFont = [UIFont fontNamesForFamilyName:@"NewWGL4Font"];
	//point = CGPointMake(0,0);
	//[@"aAHh" drawAtPoint: point withFont: importedFont];
	
	
	
	/*
	//This Group of code centers text in center of screen if 0,0 is upper left
	CGSize size = [exampleString sizeWithFont: exampleFont];
	CGRect b = self.bounds;
	CGFloat x = b.origin.x + (b.size.width - size.width) / 2;
	CGFloat y = b.origin.y + (b.size.height - size.height) / 2;
	CGPoint point = CGPointMake(x, y);
	[exampleString drawAtPoint: point withFont: exampleFont];
	 */
	
	//Getting the UIDevice. There is only one object of this class.
	UIDevice *device = [UIDevice currentDevice];	
	
	//Is it an iPhone, iPod, iPad--or a simulator?
	NSString *deviceModel = [[@"model=\"" stringByAppendingString:device.model] stringByAppendingString: @"\""];
	
	//Previously, you would use uniqueIdentifier, however, this no longer works.  I think due to changes by apple about unique identifiable information across vendors/apps (aka privacy)
	//we now use identifierForVendor which returns an NSUUID
	NSString *deviceIdentifierForVendor = [[@"identifier=\"" stringByAppendingString:device.identifierForVendor.UUIDString] stringByAppendingString: @"\""];
	
	//name of operating system, e.g. "iPhone OS"
	NSString *deviceSystemName = [NSString concatenateStrings:@"deviceSystemName=\"",device.systemName,@"\"",nil];
	
	//version number of operating system, e.g., "6.1"
	//NSString *deviceSystemVersion = [[@"deviceSystemVersion=\"" stringByAppendingString:device.systemVersion] stringByAppendingString: @"\""];
	NSString *deviceSystemVersion = [NSString concatenateStrings:@"deviceSystemVersion=\"",device.systemVersion,@"\"", nil];	
	int lineSpacing=20;
	
	NSLog(@"%@.", deviceModel);
	NSLog(@"%@.", deviceIdentifierForVendor);
	NSLog(@"%@.", deviceSystemName);
	NSLog(@"%@.", deviceSystemVersion);
	
	//Calculate total heights
	int totalHeight=[deviceModel sizeWithFont: exampleFont].height+[deviceIdentifierForVendor sizeWithFont: exampleFont2].height+[deviceSystemName sizeWithFont: exampleFont].height+[deviceSystemVersion sizeWithFont: exampleFont].height;
	totalHeight=totalHeight+3*lineSpacing;
	
	int currentYLocation=-totalHeight/2;
	
	//Change Color to purple
	CGContextSetRGBFillColor(UIGraphicsGetCurrentContext(), 0, .5, 1.0, 1.0);
	
	size = [deviceModel sizeWithFont: exampleFont];
	point = CGPointMake(-size.width / 2, currentYLocation);
	[deviceModel drawAtPoint: point withFont: exampleFont];
	
	currentYLocation=currentYLocation+size.height+lineSpacing;
	
	//Change color to white
	CGContextSetRGBFillColor(UIGraphicsGetCurrentContext(), 1.0, 1.0, 1.0, 1.0);
	
	size = [deviceIdentifierForVendor sizeWithFont: exampleFont2];
	point = CGPointMake(-size.width / 2, currentYLocation);
	[deviceIdentifierForVendor drawAtPoint: point withFont: exampleFont2];
	
	
	currentYLocation=currentYLocation+size.height+lineSpacing;
	
	//change color to black
	CGContextSetRGBFillColor(UIGraphicsGetCurrentContext(), 0.0, 0.0, 0.0, 1.0);
	
	size = [deviceSystemName sizeWithFont: exampleFont];
	point = CGPointMake(-size.width / 2, currentYLocation);
	[deviceSystemName drawAtPoint: point withFont: exampleFont];
	
	
	currentYLocation=currentYLocation+size.height+lineSpacing;
	
	size = [deviceSystemVersion sizeWithFont: exampleFont];
	point = CGPointMake(-size.width / 2, currentYLocation);
	[deviceSystemVersion drawAtPoint: point withFont: exampleFont];
	
	
	/*
	//One potential issue I see is it doesn't know time zone....
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	//Mon, 11 Jul 2011 00:00:00 +0200
	[dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"EN"]];
	[dateFormatter setDateFormat:@"EEE, d MMM yyyy HH:mm:ss ZZZZ"];
	
	
	NSCalendar *calendar =
	[[NSCalendar alloc] initWithCalendarIdentifier: NSGregorianCalendar];
	
	NSDate *thisDate = [[NSDate alloc] init];
	NSLog(@"Today is %@.\n\n", thisDate);

	
	NSDate *date = [dateFormatter dateFromString: timestamp];
	[dateFormatter release], dateFormatter = nil;
	[dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"GMT+2"]];
	
	*/
	
	//This helped me figure out right time zone so I got right time
	//NSLog(@"%@", [NSTimeZone knownTimeZoneNames]);
	
	
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	[formatter setDateStyle:NSDateFormatterShortStyle];
	[formatter setTimeStyle:NSDateFormatterShortStyle];
	[formatter setTimeZone:[NSTimeZone timeZoneWithName:@"America/New_York"]];
	
	NSDate *thisDate = [[NSDate alloc] init];
	//NSDate *aDate = [formatter dateFromString:@"9/9/11 3:54 PM"];
	//formatter.locale;
	//formatter.timeZone;
	//NSLog(@"%@",thisDate);
	NSString *thisString=[thisDate descriptionWithLocale:formatter.locale];
	NSLog(@"The current time is %@\n",thisString);
	
	//http://download.finance.yahoo.com/d/quotes.csv?s=IBM&f=sl1t1
	
	
	NSURL *url = [[NSURL alloc] initWithString:
				  @"http://finance.yahoo.com/d/quotes.csv?s=GLD&f=sl1t1"];
	
	NSError *error;
	NSString *string = [[NSString alloc]
						initWithContentsOfURL: url
						encoding: NSUTF8StringEncoding
						error: &error
						];
	
	if (string == nil) {
		string = [error localizedDescription];
	}
	

	NSArray *results = [string componentsSeparatedByString: @","];
	NSString *gldPrice = results[1];
	//NSLog(@"GLD=%@",gldPrice);
	
	gldPrice = [NSString concatenateStrings:@"GLD=",gldPrice, nil];
	
	size = [gldPrice sizeWithFont: exampleFont];
	//Put at bottom center of screen
	point = CGPointMake(-size.width / 2, +self.bounds.size.height/2-size.height);
	[gldPrice drawAtPoint: point withFont: exampleFont];
	

	
	
	

}

- (CGSize)getCGSizeFromFont:(UIFont *)aFont WithString:(NSString *)aString
{
	return [aString sizeWithFont: aFont];
}


- (NSString *)concatenateStrings:(NSString *)firstString, ...
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
