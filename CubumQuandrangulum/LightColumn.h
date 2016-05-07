//
//  LightColumn.h
//  CubumQuandrangulum
//
//  Created by Travis on 6/5/16.
//  Copyright © 2016 Fyresite. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LightColumn : NSObject

@property NSMutableArray *lightBoxes;

@property int light_column_id;

-(instancetype)initWithDictionary:(NSMutableDictionary*)dict;

@end
