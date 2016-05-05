//
//  BlockDetailView.m
//  CubumQuandrangulum
//
//  Created by Travis on 5/5/16.
//  Copyright © 2016 Fyresite. All rights reserved.
//

#import "BlockDetailView.h"
#import "AppDelegate.h"
#import <FCColorPickerViewController.h>

@interface BlockDetailView()<FCColorPickerViewControllerDelegate>
@end

@implementation BlockDetailView{
    AppDelegate *sharedDelegate;
}

-(instancetype)initWithLightBox:(LightBox*)box_model{
    self = [super init];
    if(self){
        sharedDelegate = [[UIApplication sharedApplication]delegate];
        _selected_lightbox = box_model;
        self.backgroundColor = [UIColor whiteColor];
        self.layer.borderColor = [UIColor grayColor].CGColor;
        self.layer.borderWidth = 2;
        [self setupView];
    }
    return self;
}

-(void)brightnessSliderChange:(UISlider*)sender{
    UISlider *slider = (UISlider*)sender;
    float value = slider.value;
    NSLog(@"brightnes slider tag %ld changed to %f", (long)sender.tag, value);
}

-(void)milliSliderChange:(UISlider*)sender{
    UISlider *slider = (UISlider*)sender;
    float value = slider.value;
    NSLog(@"milli slider tag %ld changed to %f", (long)sender.tag, value);
}
-(void)repeatSliderChange:(UISlider*)sender{
    UISlider *slider = (UISlider*)sender;
    float value = slider.value;
    NSLog(@"repeat slider tag %ld changed to %f", (long)sender.tag, value);
}
-(void)dismissView:(UIButton*)sender{
    [self removeFromSuperview];
}

-(void)choseColor:(UIButton*)sender {
    FCColorPickerViewController *colorPicker = [FCColorPickerViewController colorPicker];
    colorPicker.color = _chosenColor.backgroundColor;
    colorPicker.delegate = self;
    
    [colorPicker setModalPresentationStyle:UIModalPresentationFormSheet];
    [sharedDelegate.mainNavigation presentViewController:colorPicker animated:YES completion:nil];
}

#pragma mark - FCColorPickerViewControllerDelegate Methods

-(void)colorPickerViewController:(FCColorPickerViewController *)colorPicker didSelectColor:(UIColor *)color {
    _chosenColor.backgroundColor = color;
    [sharedDelegate.mainNavigation dismissViewControllerAnimated:YES completion:nil];
}

-(void)colorPickerViewControllerDidCancel:(FCColorPickerViewController *)colorPicker {
    [sharedDelegate.mainNavigation dismissViewControllerAnimated:YES completion:nil];
}

-(void)setupView{
    
    //Left content
    _leftContent = [UIView new];
    _leftContent.translatesAutoresizingMaskIntoConstraints = NO;
    
    _cube_label = [CustomViews customLabelWithTitle:[NSString stringWithFormat:@"Cube %li", (long)_selected_lightbox.position]];
    _deto_label = [CustomViews customLabelWithTitle:@"Set Animation"];
    _dropdown_deto = [CustomViews BorderedTextField:@"Placeholder"];
    
    _color_label = [CustomViews customLabelWithTitle:@"Set Color"];
    _choseColorbtn = [CustomViews buttonWithStringAndOuterBorder:@"Chose Color"];
    [_choseColorbtn addTarget:self action:@selector(choseColor:) forControlEvents:UIControlEventTouchUpInside];
    _chosenColor = [UIView new];
    _chosenColor.translatesAutoresizingMaskIntoConstraints = NO;
    _chosenColor.backgroundColor = [UIColor redColor];
    _addanotherStep = [CustomViews buttonWithStringAndOuterBorder:@"Add Another Step"];
    
    _dismissButton = [CustomViews buttonWithImage:@"dismissBlue"];
    [_dismissButton addTarget:self action:@selector(dismissView:) forControlEvents:UIControlEventTouchUpInside];
    
    
    //Right Content
    _rightContent = [UIView new];
    _rightContent.translatesAutoresizingMaskIntoConstraints = NO;
    
    _brightnessLabel =[CustomViews customLabelWithTitle:@"Set Brightness (0-5)"];
    _brightnessSlider = [CustomViews sliderBar];
    _brightnessSlider.tag = 1;
    [_brightnessSlider addTarget:self action:@selector(brightnessSliderChange:) forControlEvents:UIControlEventTouchUpInside];
    _brightnessValue = [CustomViews customLabelWithTitle:@"Value: "];
    
    _delayMilliLabel = [CustomViews customLabelWithTitle:@"Set Delay (0-10000)"];
    _delayMilliSlider = [CustomViews sliderBar];
    _delayMilliSlider.tag = 2;
    [_delayMilliSlider addTarget:self action:@selector(milliSliderChange:) forControlEvents:UIControlEventTouchUpInside];
    _delayValue = [CustomViews customLabelWithTitle:@"Value: "];
    
    _repeatStepLabel = [CustomViews customLabelWithTitle:@"Repeat Step (1-15x)"];
    _repeatStepSlider = [CustomViews sliderBar];
    _repeatStepSlider.tag = 3;
    [_repeatStepSlider addTarget:self action:@selector(repeatSliderChange:) forControlEvents:UIControlEventTouchUpInside];
    _repeatValue = [CustomViews customLabelWithTitle:@"Value: "];
    
    
    [_rightContent addSubview:_dismissButton];
    
    [self addSubview:_leftContent];
    [_leftContent addSubview:_cube_label];
    [_leftContent addSubview:_deto_label];
    [_leftContent addSubview:_dropdown_deto];
//    [_leftContent addSubview:_addanotherStep];
    [_leftContent addSubview:_chosenColor];
    [_leftContent addSubview:_choseColorbtn];
    [_leftContent addSubview:_color_label];
    [_leftContent addSubview:_addanotherStep];
    [self addSubview:_rightContent];
    [_rightContent addSubview:_brightnessSlider];
    [_rightContent addSubview:_brightnessLabel];
    [_rightContent addSubview:_brightnessValue];
    [_rightContent addSubview:_delayMilliSlider];
    [_rightContent addSubview:_delayMilliLabel];
    [_rightContent addSubview:_delayValue];
    [_rightContent addSubview:_repeatStepSlider];
    [_rightContent addSubview:_repeatStepLabel];
    [_rightContent addSubview:_repeatValue];
    
    
    //Left Content constrant
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_leftContent attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_leftContent attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_leftContent attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_leftContent attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:0.5 constant:0.0]];
    
    //Cube Label
    [_leftContent addConstraint:[NSLayoutConstraint constraintWithItem:_cube_label attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_leftContent attribute:NSLayoutAttributeTop multiplier:1.0 constant:10.0]];
    [_leftContent addConstraint:[NSLayoutConstraint constraintWithItem:_cube_label attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_leftContent attribute:NSLayoutAttributeWidth multiplier:.9 constant:0.0]];
    [_leftContent addConstraint:[NSLayoutConstraint constraintWithItem:_cube_label attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:_leftContent attribute:NSLayoutAttributeHeight multiplier:.05 constant:0.0]];
    [_leftContent addConstraint:[NSLayoutConstraint constraintWithItem:_cube_label attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_leftContent attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    //setanimation label
    [_leftContent addConstraint:[NSLayoutConstraint constraintWithItem:_deto_label attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_cube_label attribute:NSLayoutAttributeBottom multiplier:1.0 constant:20.0]];
    [_leftContent addConstraint:[NSLayoutConstraint constraintWithItem:_deto_label attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_leftContent attribute:NSLayoutAttributeWidth multiplier:.9 constant:0.0]];
    [_leftContent addConstraint:[NSLayoutConstraint constraintWithItem:_deto_label attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:_leftContent attribute:NSLayoutAttributeHeight multiplier:.05 constant:0.0]];
    [_leftContent addConstraint:[NSLayoutConstraint constraintWithItem:_deto_label attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_leftContent attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    //dropdown textfield
    [_leftContent addConstraint:[NSLayoutConstraint constraintWithItem:_dropdown_deto attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_deto_label attribute:NSLayoutAttributeBottom multiplier:1.0 constant:5.0]];
    [_leftContent addConstraint:[NSLayoutConstraint constraintWithItem:_dropdown_deto attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_leftContent attribute:NSLayoutAttributeWidth multiplier:.9 constant:0.0]];
    [_leftContent addConstraint:[NSLayoutConstraint constraintWithItem:_dropdown_deto attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:_leftContent attribute:NSLayoutAttributeHeight multiplier:.05 constant:0.0]];
    [_leftContent addConstraint:[NSLayoutConstraint constraintWithItem:_dropdown_deto attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_leftContent attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    
    
    //delayValue start
    [_leftContent addConstraint:[NSLayoutConstraint constraintWithItem:_color_label attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_dropdown_deto attribute:NSLayoutAttributeBottom multiplier:1.0 constant:50.0]];
    [_leftContent addConstraint:[NSLayoutConstraint constraintWithItem:_color_label attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_leftContent attribute:NSLayoutAttributeWidth multiplier:.9 constant:0.0]];
    [_leftContent addConstraint:[NSLayoutConstraint constraintWithItem:_color_label attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:_leftContent attribute:NSLayoutAttributeHeight multiplier:.05 constant:0.0]];
    [_leftContent addConstraint:[NSLayoutConstraint constraintWithItem:_color_label attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_leftContent attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    //dalay Slider
    [_leftContent addConstraint:[NSLayoutConstraint constraintWithItem:_chosenColor attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_color_label attribute:NSLayoutAttributeBottom multiplier:1.0 constant:10.0]];
    [_leftContent addConstraint:[NSLayoutConstraint constraintWithItem:_chosenColor attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_leftContent attribute:NSLayoutAttributeWidth multiplier:.5 constant:0.0]];
    [_leftContent addConstraint:[NSLayoutConstraint constraintWithItem:_chosenColor attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:_leftContent attribute:NSLayoutAttributeHeight multiplier:.12 constant:0.0]];
    [_leftContent addConstraint:[NSLayoutConstraint constraintWithItem:_chosenColor attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_leftContent attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
//    //dlay label
    [_leftContent addConstraint:[NSLayoutConstraint constraintWithItem:_choseColorbtn attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_chosenColor attribute:NSLayoutAttributeBottom multiplier:1.0 constant:5.0]];
    [_leftContent addConstraint:[NSLayoutConstraint constraintWithItem:_choseColorbtn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_leftContent attribute:NSLayoutAttributeWidth multiplier:.9 constant:0.0]];
    [_leftContent addConstraint:[NSLayoutConstraint constraintWithItem:_choseColorbtn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:_leftContent attribute:NSLayoutAttributeHeight multiplier:.05 constant:0.0]];
    [_leftContent addConstraint:[NSLayoutConstraint constraintWithItem:_choseColorbtn attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_leftContent attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];

    //Another Step
    [_leftContent addConstraint:[NSLayoutConstraint constraintWithItem:_addanotherStep attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_leftContent attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-150.0]];
    [_leftContent addConstraint:[NSLayoutConstraint constraintWithItem:_addanotherStep attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_leftContent attribute:NSLayoutAttributeWidth multiplier:.9 constant:0.0]];
    [_leftContent addConstraint:[NSLayoutConstraint constraintWithItem:_addanotherStep attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:_leftContent attribute:NSLayoutAttributeHeight multiplier:.05 constant:0.0]];
    [_leftContent addConstraint:[NSLayoutConstraint constraintWithItem:_addanotherStep attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_leftContent attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    //
    
    
    //START RIGHT CONTENT
    //Right contentConstraint
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_rightContent attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_rightContent attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_rightContent attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_rightContent attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:0.5 constant:0.0]];
    
    //Brightness Value
    [_rightContent addConstraint:[NSLayoutConstraint constraintWithItem:_brightnessValue attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_rightContent attribute:NSLayoutAttributeTop multiplier:1.0 constant:10.0]];
     [_rightContent addConstraint:[NSLayoutConstraint constraintWithItem:_brightnessValue attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_rightContent attribute:NSLayoutAttributeWidth multiplier:.9 constant:0.0]];
     [_rightContent addConstraint:[NSLayoutConstraint constraintWithItem:_brightnessValue attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:_rightContent attribute:NSLayoutAttributeHeight multiplier:.05 constant:0.0]];
     [_rightContent addConstraint:[NSLayoutConstraint constraintWithItem:_brightnessValue attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_rightContent attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    //Brightness Slider
    [_rightContent addConstraint:[NSLayoutConstraint constraintWithItem:_brightnessSlider attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_brightnessValue attribute:NSLayoutAttributeBottom multiplier:1.0 constant:20.0]];
    [_rightContent addConstraint:[NSLayoutConstraint constraintWithItem:_brightnessSlider attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_rightContent attribute:NSLayoutAttributeWidth multiplier:.9 constant:0.0]];
    [_rightContent addConstraint:[NSLayoutConstraint constraintWithItem:_brightnessSlider attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:_rightContent attribute:NSLayoutAttributeHeight multiplier:.05 constant:0.0]];
    [_rightContent addConstraint:[NSLayoutConstraint constraintWithItem:_brightnessSlider attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_rightContent attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    //Brightness label
    [_rightContent addConstraint:[NSLayoutConstraint constraintWithItem:_brightnessLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_brightnessSlider attribute:NSLayoutAttributeBottom multiplier:1.0 constant:5.0]];
    [_rightContent addConstraint:[NSLayoutConstraint constraintWithItem:_brightnessLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_rightContent attribute:NSLayoutAttributeWidth multiplier:.9 constant:0.0]];
    [_rightContent addConstraint:[NSLayoutConstraint constraintWithItem:_brightnessLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:_rightContent attribute:NSLayoutAttributeHeight multiplier:.05 constant:0.0]];
    [_rightContent addConstraint:[NSLayoutConstraint constraintWithItem:_brightnessLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_rightContent attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    
    //delayValue start
    [_rightContent addConstraint:[NSLayoutConstraint constraintWithItem:_delayValue attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_brightnessLabel attribute:NSLayoutAttributeBottom multiplier:1.0 constant:50.0]];
    [_rightContent addConstraint:[NSLayoutConstraint constraintWithItem:_delayValue attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_rightContent attribute:NSLayoutAttributeWidth multiplier:.9 constant:0.0]];
    [_rightContent addConstraint:[NSLayoutConstraint constraintWithItem:_delayValue attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:_rightContent attribute:NSLayoutAttributeHeight multiplier:.05 constant:0.0]];
    [_rightContent addConstraint:[NSLayoutConstraint constraintWithItem:_delayValue attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_rightContent attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    //dalay Slider
    [_rightContent addConstraint:[NSLayoutConstraint constraintWithItem:_delayMilliSlider attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_delayValue attribute:NSLayoutAttributeBottom multiplier:1.0 constant:10.0]];
    [_rightContent addConstraint:[NSLayoutConstraint constraintWithItem:_delayMilliSlider attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_rightContent attribute:NSLayoutAttributeWidth multiplier:.9 constant:0.0]];
    [_rightContent addConstraint:[NSLayoutConstraint constraintWithItem:_delayMilliSlider attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:_rightContent attribute:NSLayoutAttributeHeight multiplier:.05 constant:0.0]];
    [_rightContent addConstraint:[NSLayoutConstraint constraintWithItem:_delayMilliSlider attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_rightContent attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    //dlay label
    [_rightContent addConstraint:[NSLayoutConstraint constraintWithItem:_delayMilliLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_delayMilliSlider attribute:NSLayoutAttributeBottom multiplier:1.0 constant:5.0]];
    [_rightContent addConstraint:[NSLayoutConstraint constraintWithItem:_delayMilliLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_rightContent attribute:NSLayoutAttributeWidth multiplier:.9 constant:0.0]];
    [_rightContent addConstraint:[NSLayoutConstraint constraintWithItem:_delayMilliLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:_rightContent attribute:NSLayoutAttributeHeight multiplier:.05 constant:0.0]];
    [_rightContent addConstraint:[NSLayoutConstraint constraintWithItem:_delayMilliLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_rightContent attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    
    
    //repeat value start
    [_rightContent addConstraint:[NSLayoutConstraint constraintWithItem:_repeatValue attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_delayMilliLabel attribute:NSLayoutAttributeBottom multiplier:1.0 constant:50.0]];
    [_rightContent addConstraint:[NSLayoutConstraint constraintWithItem:_repeatValue attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_rightContent attribute:NSLayoutAttributeWidth multiplier:.9 constant:0.0]];
    [_rightContent addConstraint:[NSLayoutConstraint constraintWithItem:_repeatValue attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:_rightContent attribute:NSLayoutAttributeHeight multiplier:.05 constant:0.0]];
    [_rightContent addConstraint:[NSLayoutConstraint constraintWithItem:_repeatValue attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_rightContent attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    //repeat Slider
    [_rightContent addConstraint:[NSLayoutConstraint constraintWithItem:_repeatStepSlider attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_repeatValue attribute:NSLayoutAttributeBottom multiplier:1.0 constant:10.0]];
    [_rightContent addConstraint:[NSLayoutConstraint constraintWithItem:_repeatStepSlider attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_rightContent attribute:NSLayoutAttributeWidth multiplier:.9 constant:0.0]];
    [_rightContent addConstraint:[NSLayoutConstraint constraintWithItem:_repeatStepSlider attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:_rightContent attribute:NSLayoutAttributeHeight multiplier:.05 constant:0.0]];
    [_rightContent addConstraint:[NSLayoutConstraint constraintWithItem:_repeatStepSlider attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_rightContent attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    //repeat label
    [_rightContent addConstraint:[NSLayoutConstraint constraintWithItem:_repeatStepLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_repeatStepSlider attribute:NSLayoutAttributeBottom multiplier:1.0 constant:5.0]];
    [_rightContent addConstraint:[NSLayoutConstraint constraintWithItem:_repeatStepLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_rightContent attribute:NSLayoutAttributeWidth multiplier:.9 constant:0.0]];
    [_rightContent addConstraint:[NSLayoutConstraint constraintWithItem:_repeatStepLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:_rightContent attribute:NSLayoutAttributeHeight multiplier:.05 constant:0.0]];
    [_rightContent addConstraint:[NSLayoutConstraint constraintWithItem:_repeatStepLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_rightContent attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    
    //Another Step
    [_rightContent addConstraint:[NSLayoutConstraint constraintWithItem:_dismissButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_rightContent attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-50.0]];
    [_rightContent addConstraint:[NSLayoutConstraint constraintWithItem:_dismissButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:100.0]];
    [_rightContent addConstraint:[NSLayoutConstraint constraintWithItem:_dismissButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:100.0]];
    [_rightContent addConstraint:[NSLayoutConstraint constraintWithItem:_dismissButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_rightContent attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    //
    
    
    
    
    
    
    
    
    
}

@end
