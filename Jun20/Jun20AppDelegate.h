//
//  Jun20AppDelegate.h
//  Jun20
//
//  Created by david morton on 6/14/13.
//  Copyright (c) 2013 David Morton Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>
@class View;

@interface Jun20AppDelegate: UIResponder <UIApplicationDelegate> {
	View *view;
	UIWindow *_window;
}

@property (strong, nonatomic) UIWindow *window;
@end