//
//  AppDelegate.m
//  CubumQuandrangulum
//
//  Created by Travis on 5/5/16.
//  Copyright © 2016 Fyresite. All rights reserved.
//

#import "AppDelegate.h"
#import "LightBox.h"
#import "LightColumn.h"

@interface AppDelegate ()



@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.=
    
    _activityIndicator = [[CustomIndicator alloc] init];
    _mainMenu = [[MainMenu alloc] init];
    
    _mainNavigation = [[UINavigationController alloc] initWithRootViewController:_mainMenu];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [self.window setRootViewController:_mainNavigation];
    [_mainNavigation popToRootViewControllerAnimated:YES];
    [self.window makeKeyAndVisible];
    
    //instantiate objects.
    [self createObjects];
    
    
    return YES;
}

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window{
    return UIInterfaceOrientationMaskLandscape;
}

-(void)createObjects{
    self.cubes = [NSMutableArray new];
    self.columns = [NSMutableArray new];
    for (int x = 0; x < 45; x++) {
        if(x % 5 == 0){
            //Create lightColumn if x is divisble by 5
            LightColumn *newColumn = [[LightColumn alloc] initWithDictionary:
                                      (NSMutableDictionary*)@{@"light_column_id":[NSMutableString stringWithFormat:@"%i", (x/5)+1]}];
            
            
            //Add to light columns
            [self.columns addObject:newColumn];
        }
        //Each circuit has 0-8 bytes on it. 
        NSNumber *first_number = [NSNumber numberWithInt:(x*8)];
        NSNumber *last_number = [NSNumber numberWithInt:[first_number intValue]+8];
        
        LightColumn *current_column = [self.columns lastObject];
        
        LightBox *newLightBox = [[LightBox alloc] initWithDictionary:(NSMutableDictionary*)
                                 @{@"first_number":first_number, @"last_number":last_number}];
        
        
        newLightBox.name = @"Travis Was here";
        newLightBox.number = x;
        newLightBox.box_id = x;
        newLightBox.position = (int)current_column.lightBoxes.count;
        newLightBox.columnNumber = current_column.light_column_id;
        newLightBox.column = current_column;
        
        [current_column.lightBoxes addObject:newLightBox];
        [self.cubes addObject:newLightBox];
        
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
