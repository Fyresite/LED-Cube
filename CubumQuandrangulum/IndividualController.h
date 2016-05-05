//
//  IndividualController.h
//  CubumQuandrangulum
//
//  Created by Travis on 5/5/16.
//  Copyright © 2016 Fyresite. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IndividualController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property UICollectionView *lightbox_collection;
@property UIButton *setupAnimationBtn;
@property UISlider *slider;
@property UILabel *repeat;
@property UIButton *doItbtn;

-(instancetype)initWithCollectionSet:(NSMutableArray*)collectionSet;

@end
