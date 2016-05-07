//
//  LightColumn.m
//  CubumQuandrangulum
//
//  Created by Travis on 6/5/16.
//  Copyright © 2016 Fyresite. All rights reserved.
//

#import "LightColumn.h"

@implementation LightColumn

-(instancetype)initWithDictionary:(NSMutableDictionary*)dict{
    if(self){
        self.light_column_id = [[dict objectForKey:@"light_column_id"] intValue];
        
        
        self.lightBoxes =[NSMutableArray new];
        
        
        
    }
    return self;
}

@end
