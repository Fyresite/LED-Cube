//
//  CustomViews.m
//  Shmooz
//
//  Created by Travis Delly on 1/1/16.
//  Copyright © 2016 Travis Delly. All rights reserved.
//

#import "CustomViews.h"
#import <QuartzCore/QuartzCore.h>

@implementation CustomViews



+(void)AnimateView:(UIView*)view{
    [UIView transitionWithView:view
                      duration:1
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    animations:^{}
                    completion:nil];
}


+(void)expandingCircle:(UIView*)circle{

    CGFloat animationDuration = 4.0; // Your duration
    CGFloat animationDelay = 3.0; // Your delay (if any)
    
    circle.layer.masksToBounds = YES;
    [[circle layer] setCornerRadius:circle.frame.size.height/2];
    
    CABasicAnimation *cornerRadiusAnimation = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    [cornerRadiusAnimation setFromValue:[NSNumber numberWithFloat:50.0]]; // The current value
    [cornerRadiusAnimation setToValue:[NSNumber numberWithFloat:10.0]]; // The new value
    [cornerRadiusAnimation setDuration:animationDuration];
    [cornerRadiusAnimation setBeginTime:CACurrentMediaTime() + animationDelay];
    
    // If your UIView animation uses a timing funcition then your basic animation needs the same one
    [cornerRadiusAnimation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    
    // This will keep make the animation look as the "from" and "to" values before and after the animation
    [cornerRadiusAnimation setFillMode:kCAFillModeBoth];
    [[circle layer] addAnimation:cornerRadiusAnimation forKey:@"keepAsCircle"];
    [[circle layer] setCornerRadius:10.0]; // Core Animation doesn't change the real value so we have to.
    
    [UIView animateWithDuration:animationDuration
                          delay:animationDelay
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [self growView:circle];// Arbitrary frame ...
                         // You other UIView animations in here...
                     } completion:^(BOOL finished) {
                         
                         //circle.frame = oldSize;
                         // Maybe you have your completion in here...
                     }];
}

+(UITextField*)nonBorderedTextField:(NSString*)placeholder{
    UITextField *textfield = [UITextField new];
    textfield.layer.cornerRadius = 5;
    textfield.placeholder = placeholder;
    textfield.translatesAutoresizingMaskIntoConstraints = NO;
    textfield.textAlignment = NSTextAlignmentCenter;
    return textfield;
}

+(UITextField *)BorderedTextField:(NSString *)placeholder{
    UITextField *textfield = [UITextField new];
    textfield.layer.cornerRadius = 5;
    textfield.placeholder = placeholder;
    textfield.layer.borderColor = [UIColor blackColor].CGColor;
    textfield.layer.borderWidth = 1;
    textfield.translatesAutoresizingMaskIntoConstraints = NO;
    textfield.textAlignment = NSTextAlignmentCenter;
    return textfield;
}

+(UITextView*)defaultTextView:(NSString *)text{
    UITextView* textview = [[UITextView alloc] init];
    textview.text = text;
    textview.translatesAutoresizingMaskIntoConstraints = NO;
    
    return textview;
    
}

+(UITextField *)borderedTextfield{
    UITextField *textfield = [UITextField new];
    textfield.layer.cornerRadius = 10;
    textfield.layer.masksToBounds = YES;
    textfield.layer.borderWidth = 1;
    textfield.layer.borderColor = [UIColor blackColor].CGColor;
    textfield.translatesAutoresizingMaskIntoConstraints = NO;
    textfield.textAlignment = NSTextAlignmentCenter;
    return textfield;
}
+(UIView*)headerView{
    UIView *header = [UIView new];
    header.translatesAutoresizingMaskIntoConstraints = NO;
    
    return header;
}

+(UIImageView*)customImageView:(NSString*)imageString{
    UIImageView* charImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageString]];
    charImage.translatesAutoresizingMaskIntoConstraints = NO;
    charImage.layer.borderColor = [UIColor blackColor].CGColor;
    charImage.layer.borderWidth = 5;
    
    return charImage;
}

+(UIImageView*)customImageViewNoBorder:(NSString*)imageString{
    UIImageView* charImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageString]];
    charImage.translatesAutoresizingMaskIntoConstraints = NO;
    
    return charImage;
}

+(void)bounceUPMainCell:(UIView*)view{
    
    //view.transform = CGAffineTransformMakeScale(.0001, .0001);
    
    [UIView animateKeyframesWithDuration:.6 delay:0.0 options:UIViewKeyframeAnimationOptionCalculationModeCubic animations:^{
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:.5 animations:^{
            view.transform = CGAffineTransformMakeScale(1.60, 1.60);
        }];
        [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:.5 animations:^{
            view.transform = CGAffineTransformMakeScale(1.40, 1.40);
        }];
        
    } completion:^(BOOL finished) {
       //completion
    }];
}

+(void)bounceView:(UIView*)view{
    
    view.transform = CGAffineTransformMakeScale(.0001, .0001);
    
    [UIView animateKeyframesWithDuration:.6 delay:0.0 options:UIViewKeyframeAnimationOptionCalculationModeCubic animations:^{
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:.5 animations:^{
            view.transform = CGAffineTransformMakeScale(1.40, 1.40);
        }];
        [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:.5 animations:^{
            view.transform = CGAffineTransformIdentity;
        }];
        
    } completion:^(BOOL finished) {
        //completion
    }];
}

+(void)shrinkViewToPoint:(CGPoint)point view:(UIView *)view completionHandler:(void (^)(BOOL success))completionHandler{
    
    [UIView animateKeyframesWithDuration:.6 delay:0.0 options:UIViewKeyframeAnimationOptionCalculationModeCubic animations:^{
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:.3 animations:^{
            view.center = point;
            view.transform = CGAffineTransformMakeScale(.5, .5);
        }];
        [UIView addKeyframeWithRelativeStartTime:0.3 relativeDuration:.3 animations:^{
            view.transform = CGAffineTransformMakeScale(.0001, .0001);
        }];
        
    } completion:^(BOOL finished) {
        //completion
        completionHandler(YES);
        
    }];
    
}

+(void)shrinkViewToCenterOfView:(UIView *)view completionHandler:(void (^)(BOOL success))completionHandler {
//    float height = view.frame.size.height;
//    float width = view.frame.size.width;
//    //Initial Stuff
//    height > width ? (view.transform = CGAffineTransformMakeScale(1.0, width/height)) : (view.transform = CGAffineTransformMakeScale(height/width, 1.0));
 
    
    [UIView animateKeyframesWithDuration:.6 delay:0.0 options:UIViewKeyframeAnimationOptionCalculationModeCubic animations:^{
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:.3 animations:^{
            view.transform = CGAffineTransformMakeScale(.5, .5);
        }];
        [UIView addKeyframeWithRelativeStartTime:0.3 relativeDuration:.3 animations:^{
            view.transform = CGAffineTransformMakeScale(.0001, .0001);
        }];
        
    } completion:^(BOOL finished) {
        //completion
        completionHandler(YES);
        
    }];
}

+(void)growView:(UIView *)view{
    view.transform = CGAffineTransformMakeScale(.0001, .0001);
    
    [UIView animateKeyframesWithDuration:.6 delay:0.0 options:UIViewKeyframeAnimationOptionCalculationModeCubic animations:^{
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:.5 animations:^{
            view.transform = CGAffineTransformMakeScale(.8, .8);
        }];
        [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:.5 animations:^{
            view.transform = CGAffineTransformIdentity;
        }];
        
    } completion:^(BOOL finished) {
        //completion
    }];
}

+(UILabel *)customLabel{
    UILabel *label = [UILabel new];
    label.translatesAutoresizingMaskIntoConstraints = NO;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:32];
    return label;
}

+(UILabel *)customLabelWithTitle:(NSString*)title{
    UILabel *label = [UILabel new];
    label.text = title;
    label.translatesAutoresizingMaskIntoConstraints = NO;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:32];
    return label;
}

+(UISlider *)sliderBar{
    UISlider *slider = [UISlider new];
    slider.translatesAutoresizingMaskIntoConstraints = NO;
    
    return slider;
}



+(UIButton *)buttonWithImage:(NSString *)image{
    UIButton* newButton = [UIButton new];
    newButton.translatesAutoresizingMaskIntoConstraints = NO;
    [newButton setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [newButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    return newButton;
}

+(UIButton*)buttonWithString:(NSString *)string{
    UIButton* newButton = [UIButton new];
    newButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    newButton.translatesAutoresizingMaskIntoConstraints = NO;
    newButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    newButton.titleLabel.numberOfLines = 0;
    newButton.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    newButton.layer.masksToBounds = YES;
    newButton.layer.cornerRadius = 4;
    newButton.layer.borderColor = [UIColor grayColor].CGColor;
    newButton.layer.borderWidth = 1.0f;
    [newButton.titleLabel setFont:[UIFont systemFontOfSize:24]];
    [newButton setBackgroundColor:[UIColor grayColor]];
    [newButton setTitle:string forState:UIControlStateNormal];
    newButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    [newButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    return newButton;
}

+(UIButton *)buttonWithStringAndOuterBorder:(NSString *)string{
    UIButton* newButton = [UIButton new];
    newButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    newButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    [newButton.titleLabel setFont:[UIFont systemFontOfSize:24]];
    newButton.translatesAutoresizingMaskIntoConstraints = NO;
    newButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    newButton.titleLabel.numberOfLines = 0;
    newButton.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    newButton.layer.masksToBounds = YES;
    newButton.layer.cornerRadius = 4;
    newButton.layer.borderColor = [UIColor grayColor].CGColor;
    newButton.layer.borderWidth = 1.0f;
    [newButton setBackgroundColor:[UIColor whiteColor]];
    [newButton setTitle:string forState:UIControlStateNormal];
    [newButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    return newButton;
}

+(UILabel *)LabelWithShadow{
    UILabel *defaultLabel = [UILabel new];
    [defaultLabel setBackgroundColor:[UIColor clearColor]];
    
    [defaultLabel setAdjustsFontSizeToFitWidth:YES];
    
    [defaultLabel setTextColor:[UIColor blackColor]];
    
    [defaultLabel setUserInteractionEnabled:NO];
    
    [defaultLabel setFont:[UIFont fontWithName:@"digital-7" size:12]];
    
    defaultLabel.layer.shadowColor =[[UIColor whiteColor ]CGColor ];
    
    defaultLabel.layer.shadowOffset=(CGSizeMake(0, 0));
    
    defaultLabel.layer.shadowOpacity=1;
    
    defaultLabel.layer.shadowRadius=3.0;
    
    defaultLabel.layer.masksToBounds=NO;
    
    defaultLabel.shadowColor=[UIColor darkGrayColor];
    
    defaultLabel.shadowOffset=CGSizeMake(0, 2);
    
    return defaultLabel;
}

@end
