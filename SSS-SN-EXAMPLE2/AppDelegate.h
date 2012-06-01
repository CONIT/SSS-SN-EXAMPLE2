//
//  AppDelegate.h
//  SSS-SN-EXAMPLE2
//
//  Created by sasaki on 12/06/01.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

- (void) sendAPNsToken:(NSData*)devicetoken;
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ViewController *viewController;

@end
