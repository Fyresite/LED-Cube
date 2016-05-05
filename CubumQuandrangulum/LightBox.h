//
//  LightBoxCell.h
//  CubumQuandrangulum
//
//  Created by Travis on 5/5/16.
//  Copyright © 2016 Fyresite. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LightBox : NSObject

-(instancetype)initWithDictionary:(NSMutableDictionary*)dict;

@property NSInteger number;
@property NSString *name;
@property NSInteger columnNumber;
@property NSString *box_id;

@property NSInteger position;

@property float brightness;
@property NSInteger repeat;
@property float delay;

@property NSMutableArray *animations;

@property UIColor *color;

@end
