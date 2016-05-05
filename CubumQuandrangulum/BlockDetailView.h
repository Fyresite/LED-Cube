//
//  BlockDetailView.h
//  CubumQuandrangulum
//
//  Created by Travis on 5/5/16.
//  Copyright © 2016 Fyresite. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LightBox.h"

@interface BlockDetailView : UIView

@property UILabel *cube_label;
@property UILabel *deto_label;
@property UITextField *dropdown_deto;
@property UILabel *color_label;
@property UIButton *choseColorbtn;
@property UIView *chosenColor;
@property UIButton *addanotherStep;


@property UIButton *dismissButton;

@property UILabel *brightnessValue;
@property UISlider *brightnessSlider;
@property UILabel *brightnessLabel;
@property UILabel *delayValue;
@property UISlider *delayMilliSlider;
@property UILabel *delayMilliLabel;
@property UILabel *repeatValue;
@property UISlider *repeatStepSlider;
@property UILabel *repeatStepLabel;

@property LightBox *selected_lightbox;

@property UIView *leftContent;

@property UIView *rightContent;

-(instancetype)initWithLightBox:(LightBox*)box_model;

@end
