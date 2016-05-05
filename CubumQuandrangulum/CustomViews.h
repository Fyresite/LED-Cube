//
//  CustomViews.h
//  Shmooz
//
//  Created by Travis Delly on 1/1/16.
//  Copyright © 2016 Travis Delly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CustomViews : NSObject
+(void)bounceView:(UIView*)view;
+(void)shrinkViewToCenterOfView:(UIView *)view completionHandler:(void (^)(BOOL success))completionHandler;

+(void)shrinkViewToPoint:(CGPoint)point view:(UIView *)view completionHandler:(void (^)(BOOL success))completionHandler;

+(void)growView:(UIView*)view;
+(void)expandingCircle:(UIView*)circle;
+(void)AnimateView:(UIView*)view;
+(UIImageView*)customImageViewNoBorder:(NSString*)imageString;
+(UILabel *)LabelWithShadow;

+(UITextField*)nonBorderedTextField:(NSString*)placeholder;
+(UITextField*)BorderedTextField:(NSString*)placeholder;

+(UIButton*)buttonWithString:(NSString *)string;
+(UIButton*)buttonWithStringAndOuterBorder:(NSString*)string;
+(UIButton *)buttonWithImage:(NSString *)image;

+(UISlider *)sliderBar;
+(UILabel *)customLabel;

+(UILabel *)customLabelWithTitle:(NSString*)title;

+(UIImageView*)customImageView:(NSString*)imageString;
+(UIView*)headerView;

+(UITextView*)defaultTextView:(NSString *)text;

+(void)bounceUPMainCell:(UIView*)view;

@end
