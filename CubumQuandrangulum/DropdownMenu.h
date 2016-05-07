//
//  DropdownMenu.h
//  CubumQuandrangulum
//
//  Created by Travis on 6/5/16.
//  Copyright © 2016 Fyresite. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DropdownMenu : UIView <UITableViewDataSource, UITableViewDelegate>

@property UITableView *menu;
-(void)setupOnView:(UIView*)controller dropdownFor:(UIView*)target height:(float)maxHeight;

@end
