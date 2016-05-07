//
//  LightBoxCell.m
//  CubumQuandrangulum
//
//  Created by Travis on 5/5/16.
//  Copyright © 2016 Fyresite. All rights reserved.
//

#import "LightBox.h"
#import "QeueAnimation.h"

@implementation LightBox

-(instancetype)initWithDictionary:(NSMutableDictionary*)dict{
    if(self){
        
        self.color = [UIColor colorWithRed:188.0f/255.0f green:166.0f/255.0f blue:144.0f/255.0f alpha:1.0];
        self.brightness = 225.0f;
        self.delay = 2.5;
        self.repeat = 5;
        
        self.first_number = [[dict objectForKey:@"first_number"] intValue];
        self.last_number = [[dict objectForKey:@"last_number"] intValue];
        
        self.range = NSMakeRange([[NSNumber numberWithInteger:self.first_number] integerValue],[[NSNumber numberWithInteger:self.last_number] integerValue]);
        
        _animations = [NSMutableArray new];
        
    }
    return self;
}

@end
