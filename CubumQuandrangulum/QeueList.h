//
//  QeueList.h
//  CubumQuandrangulum
//
//  Created by Travis on 6/5/16.
//  Copyright © 2016 Fyresite. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LightBox.h"
@interface QeueList : UIView <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>

@property LightBox *selected_box;

@property UITableView *queuList;
@property NSMutableArray *queuData;
@property UITextField *animationType;
@property UIButton *select;


@property UIButton *dismissButton;

@property UIImageView *oopsImage;
-(instancetype)initWithLightBox:(LightBox*)box_model;


@end
