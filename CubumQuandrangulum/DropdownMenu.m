//
//  DropdownMenu.m
//  CubumQuandrangulum
//
//  Created by Travis on 6/5/16.
//  Copyright © 2016 Fyresite. All rights reserved.
//

#import "DropdownMenu.h"

@implementation DropdownMenu{
    NSMutableArray *menuData;
}

-(instancetype)init{
    self = [super init];
    if(self){
        self.backgroundColor = [UIColor grayColor];
        self.layer.borderColor = [UIColor blackColor].CGColor;
        self.layer.borderWidth = 1;
        self.translatesAutoresizingMaskIntoConstraints = NO; 
        menuData = (NSMutableArray*)@[@"Value1", @"Value2", @"Value3", @"Value4", @"Value5"];
        [self setupMenu];
    }
    return self;
}

-(void)setupOnView:(UIView*)controller dropdownFor:(UIView*)target height:(float)maxHeight{
    [controller addSubview:self];
    [controller addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:target attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0.0]];
    [controller addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:100.0]];
    [controller addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:target attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0]];
    [controller addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:target attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0]];
}
-(void)setupMenu{
    
    _menu = [[UITableView alloc] init];
    _menu.translatesAutoresizingMaskIntoConstraints = NO;
    _menu.delegate =self;
    _menu.dataSource = self;
    [self addSubview:_menu];
    
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_menu attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_menu attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_menu attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_menu attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0.0]];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return menuData.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"choice"];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"choice"];
        
    }
    
    cell.textLabel.text = [menuData objectAtIndex:indexPath.row];
    
    return cell;
}

@end
