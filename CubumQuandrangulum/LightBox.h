//
//  LightBoxCell.h
//  CubumQuandrangulum
//
//  Created by Travis on 5/5/16.
//  Copyright © 2016 Fyresite. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LightColumn.h"

@interface LightBox : NSObject

-(instancetype)initWithDictionary:(NSMutableDictionary*)dict;

@property int number;
@property int box_id;
@property int columnNumber;
@property int position;
@property NSString *name;


@property float brightness;
@property NSInteger repeat;
@property float delay;

@property NSRange range;
@property NSInteger first_number;
@property NSInteger last_number;

// "detonation(3, 255, 0 , 0, 

@property LightColumn *column;
@property UIColor *color;


@property NSMutableArray *animations;

@end
