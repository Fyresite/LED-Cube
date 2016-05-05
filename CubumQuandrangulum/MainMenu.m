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
-(NSMutableArray*)getArrayOfLightBoxes{
    
}
-(void)individualButtonClick:(UIButton*)individualButton{
    
    IndividualController *controller = [[IndividualController alloc] initWithCollectionSet:[self getArrayOfLightBoxes]];
    [sharedDelegate.mainNavigation pushViewController:controller animated:YES];
}


-(void)setupController{
    
    _individualBtn = [CustomViews buttonWithString:@"Individual Control"];
    [_individualBtn addTarget:self action:@selector(individualButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    _columnsBtn = [CustomViews buttonWithString:@"Columns Control"];
    
    _allBtn = [CustomViews buttonWithString:@"All Control"];
    
    
    [self.view addSubview:_individualBtn];
    [self.view addSubview:_columnsBtn];
    [self.view addSubview:_allBtn];
    
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
    
    //allBtn btn
    //The btn is located on the top of the column bt
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_allBtn attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.columnsBtn attribute:NSLayoutAttributeBottom multiplier:1.0 constant:20.0]];
    //This line above determines that is at the top of the column button the constraints below just aline the x width and height
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_allBtn attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_allBtn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:.6 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_allBtn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:.1 constant:0.0]];
    
    
    
}


@end
