//
//  MCAppDelegate.h
//  MOPCON
//
//  Created by Cd Chen on 13/6/16.
//  Copyright (c) 2013年 MOPCON. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MCSplashViewController;


@interface MCAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) MCSplashViewController *rootViewController;

@end
