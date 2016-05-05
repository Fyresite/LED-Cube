//
//  LightBoxCell.m
//  CubumQuandrangulum
//
//  Created by Travis on 5/5/16.
//  Copyright © 2016 Fyresite. All rights reserved.
//

#import "LightBox.h"

@implementation LightBox

-(instancetype)initWithDictionary:(NSMutableDictionary*)dict{
    if(self){
        self.number = [[dict objectForKey:@"number"] integerValue];
        self.box_id = [dict objectForKey:@"box_id"];
        self.name = [dict objectForKey:@"name"];
        self.columnNumber = [[dict objectForKey:@"columnNumber"] integerValue];
        self.position = [[dict objectForKey:@"position"] integerValue];
        
        
    }
    return self;
}

@end
