//
//  QeueList.m
//  CubumQuandrangulum
//
//  Created by Travis on 6/5/16.
//  Copyright © 2016 Fyresite. All rights reserved.
//

#import "QeueList.h"
#import "AppDelegate.h"
#import "DropdownMenu.h"

@interface AnimationQeueCell : UITableViewCell

@property UILabel *animationName;
@property UILabel *animationId;
@property UIView *animationColors;

@end

@implementation AnimationQeueCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self setupCell];
    }
    return self;
}

-(void)setupCell{
    _animationName = [CustomViews customLabel];
    _animationId = [CustomViews customLabel];
    _animationColors = [[UIView alloc] init];
    _animationColors.translatesAutoresizingMaskIntoConstraints = NO;
    _animationColors.backgroundColor = [UIColor redColor];
    
    
    [self addSubview:_animationColors];
    [self addSubview:_animationName];
    [self addSubview:_animationId];
    
    //Animation Colors
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_animationColors attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_animationColors attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_animationColors attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:0.8 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_animationColors attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:0.3 constant:0.0]];
    
    //Animation id
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_animationId attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_animationColors attribute:NSLayoutAttributeRight multiplier:1.0 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_animationId attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_animationId attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:0.1 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_animationId attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:0.7 constant:0.0]];
    
    
    //Animation name
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_animationId attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_animationColors attribute:NSLayoutAttributeRight multiplier:1.0 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_animationId attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_animationId attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_animationId attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:0.1 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_animationId attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:0.7 constant:0.0]];
}

@end

@implementation QeueList{
    AppDelegate *sharedDelegate;
}



-(instancetype)initWithLightBox:(LightBox*)box_model{
    self = [super init];
    if (self) {
        self.layer.borderWidth = 1;
        self.layer.borderColor = [UIColor blackColor].CGColor;
        self.backgroundColor = [UIColor whiteColor];
        sharedDelegate = [[UIApplication sharedApplication] delegate];
        _selected_box = box_model;
        [self setupView];
    }
    return self;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AnimationQeueCell *cell = [tableView  dequeueReusableCellWithIdentifier:@"animation"];
    if(!cell){
        cell = [[AnimationQeueCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"animation"];
        
    }
    cell.animationName.text = @"Ani name";
    cell.animationId.text = @"Ani ID";
    cell.animationColors.backgroundColor = [UIColor redColor];
    
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _selected_box.animations.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(void)dismissView:(UIButton*)sender{
    [self removeFromSuperview];
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    DropdownMenu *dropDown = [[DropdownMenu alloc] init];
    [dropDown setupOnView:self dropdownFor:textField height:100];
    return false;
}
-(void)setupView{
    _queuList = [[UITableView alloc] init];
    _queuList.translatesAutoresizingMaskIntoConstraints = NO;
    _queuList.delegate = self;
    _queuList.dataSource = self;
    
    _select = [CustomViews buttonWithString:@"Add New Animation"];
    
    _animationType = [CustomViews BorderedTextField:@"Animation type"];
    _animationType.delegate = self;
    
    _dismissButton = [CustomViews buttonWithImage:@"dismissBlue"];
    [_dismissButton addTarget:self action:@selector(dismissView:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self addSubview:_queuList];
    [self addSubview:_select];
    [self addSubview:_animationType];
    [self addSubview:_dismissButton];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_queuList attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_queuList attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_queuList attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:0.5 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_queuList attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0.0]];
    
    //animation typw
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_animationType attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:-10.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_animationType attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:30.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_animationType attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:0.48 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_animationType attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:0.08 constant:0.0]];
    
    //add new
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_select attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:-10.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_select attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.animationType attribute:NSLayoutAttributeBottom multiplier:1.0 constant:40.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_select attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:0.48 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_select attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:0.08 constant:0.0]];
    
    if(_selected_box.animations.count == 0){
        _oopsImage = [CustomViews customImageView:@"oopsImage"];
        
        [self addSubview:_oopsImage];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_oopsImage attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_oopsImage attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_oopsImage attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:0.5 constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_oopsImage attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0.0]];
    }
    
    //Another Step
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_dismissButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-50.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_dismissButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:100.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_dismissButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:100.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_dismissButton attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:-50.0]];
    //
    
}

@end
