//
//  AppDelegate.h
//  CubumQuandrangulum
//
//  Created by Travis on 5/5/16.
//  Copyright © 2016 Fyresite. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainMenu.h"
#import "CustomViews.h"
#import "CustomScripts.h"
#import "CustomIndicator.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property UINavigationController *mainNavigation;
@property MainMenu *mainMenu;
@property CustomIndicator *activityIndicator;

@end

