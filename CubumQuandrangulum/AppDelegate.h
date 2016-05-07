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


@property NSMutableArray *columns;
@property NSMutableArray *cubes;

@end


#define TRANSFER_SERVICE_UUID           @"FB694B90-F49E-4597-8306-171BBA78F846"
#define TRANSFER_CHARACTERISTIC_UUID    @"EB6727C4-F184-497A-A656-76B0CDAC633A"

#define NOTIFY_MTU 20
