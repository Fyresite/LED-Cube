//
//  MainMenu.m
//  CubumQuandrangulum
//
//  Created by Travis on 5/5/16.
//  Copyright © 2016 Fyresite. All rights reserved.
//

#import "MainMenu.h"
#import "AppDelegate.h"
#import "IndividualController.h"
#import "BTManagerController.h"

@implementation MainMenu{
    AppDelegate *sharedDelegate;
}

-(instancetype)init{
    self = [super init];
    if(self){
        self.view.backgroundColor = [UIColor whiteColor];
        sharedDelegate = [[UIApplication sharedApplication] delegate];
        
        [self setupController];
    }
    return self;
}
-(void)individualButtonClick:(UIButton*)individualButton{
    
    
    IndividualController *controller = [[IndividualController alloc] initWithCollectionSet:[NSMutableArray new]];
    [sharedDelegate.mainNavigation pushViewController:controller animated:YES];
}

-(void)connectBTController:(UIButton*)sender{
    BTManagerController *manager = [[BTManagerController alloc] init];
    [sharedDelegate.mainNavigation pushViewController:manager animated:YES];
}

-(void)setupController{
    
    _deviceConnectedLabel = [CustomViews customLabel];
    _deviceConnectedLabel.text = @"Device not Connected";
    _deviceConnectedLabel.font = [UIFont fontWithName:@".AppleSystemUIFont" size:25];
    _deviceConnectedLabel.textColor = [UIColor redColor];
    
    _individualBtn = [CustomViews buttonWithString:@"Individual Control"];
    [_individualBtn addTarget:self action:@selector(individualButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    _columnsBtn = [CustomViews buttonWithString:@"Columns Control"];
    
    _allBtn = [CustomViews buttonWithString:@"All Control"];
    
    _connectDevice = [CustomViews buttonWithString:@"Connect Lights"];
    [_connectDevice addTarget:self action:@selector(connectBTController:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:_individualBtn];
    [self.view addSubview:_columnsBtn];
    [self.view addSubview:_allBtn];
    [self.view addSubview:_connectDevice];
    [self.view addSubview:_deviceConnectedLabel];
    
    //Column Btn Constraints
    //Everthing is related to the column btn
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_columnsBtn attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_columnsBtn attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_columnsBtn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:.6 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_columnsBtn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:.1 constant:0.0]];
    
    //indi btn
    //The btn is located on the top of the column bt
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_individualBtn attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.columnsBtn attribute:NSLayoutAttributeTop multiplier:1.0 constant:-20.0]];
    //This line above determines that is at the top of the column button the constraints below just aline the x width and height
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_individualBtn attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_individualBtn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:.6 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_individualBtn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:.1 constant:0.0]];
    
    //connectin device btn btn
    //The btn is located on the top of the indi btn
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_deviceConnectedLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.individualBtn attribute:NSLayoutAttributeTop multiplier:1.0 constant:-20.0]];
    //This line above determines that is at the top of the column button the constraints below just aline the x width and height
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_deviceConnectedLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_deviceConnectedLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:.6 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_deviceConnectedLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:.1 constant:0.0]];
    
    
    //allBtn btn
    //The btn is located on the top of the column bt
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_allBtn attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.columnsBtn attribute:NSLayoutAttributeBottom multiplier:1.0 constant:20.0]];
    //This line above determines that is at the top of the column button the constraints below just aline the x width and height
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_allBtn attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_allBtn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:.6 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_allBtn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:.1 constant:0.0]];
    
    //connect device btn
    //The btn is located on the bottom of the all bt
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_connectDevice attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.allBtn attribute:NSLayoutAttributeBottom multiplier:1.0 constant:20.0]];
    //This line above determines that is at the top of the column button the constraints below just aline the x width and height
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_connectDevice attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_connectDevice attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:.6 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_connectDevice attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:.1 constant:0.0]];
    
}


@end
