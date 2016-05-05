//
//  IndividualController.m
//  CubumQuandrangulum
//
//  Created by Travis on 5/5/16.
//  Copyright © 2016 Fyresite. All rights reserved.
//

#import "IndividualController.h"
#import "AppDelegate.h"
#import "LightBox.h"
#import "GridLayout.h"
#import "BlockDetailView.h"

#define SLIDERSTARTVALUE 5
#define SLIDERMAXVALUE 10
#define SLIDERMINVALUE 0

@interface LightBoxCell : UICollectionViewCell

@property LightBox *lightBox;
@property UILabel *number;

@end

@implementation LightBoxCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.layer.borderColor = [UIColor grayColor].CGColor;
        self.layer.borderWidth = 1.5;
    }
    return self;
}

-(void)setupCellWithBox:(LightBox*)model{
    self.lightBox = model;
    
    
    _number = [CustomViews customLabel];
    
    [self addSubview:_number];
    
    
    //Everthing is related to the column btn
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_number attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_number attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_number attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_number attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0.0]];
    
}

@end

@interface IndividualController()

@property UILabel *sliderNumber;

@end

@implementation IndividualController{
    AppDelegate *sharedDelegate;
    NSMutableArray *collection_data;
}


-(void)viewDidLoad{
    [super viewDidLoad];
}

-(instancetype)initWithCollectionSet:(NSMutableArray *)collectionSet{
    self = [super init];
    if(self){
        self.view.backgroundColor = [UIColor whiteColor];
        sharedDelegate = [[UIApplication sharedApplication] delegate];
        collection_data = collectionSet;
        [self setupController];
    }
    return self;
}
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(50, 50);
}

-(void)lightValueChange:(UISlider*)sender{
    UISlider *slider = (UISlider*)sender;
    float value = slider.value;
    
    _sliderNumber.text = [NSString stringWithFormat:@"Value: %.2f", value];
    
    NSLog(@"slider changed to %f", value);
}
-(void)justDoItClicked:(UIButton*)sender{
    
}
-(void)setupController{
    //Layout and collection
    GridLayout *layout = [[GridLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(10.0f, 10.0f, 10.0f, 10.0f);
    layout.minimumInteritemSpacing = 20.0f;
    layout.alignment = GridRowAlignmentCenter;
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.lightbox_collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    self.lightbox_collection.delegate = self;
    self.lightbox_collection.dataSource = self;
    [self.lightbox_collection registerClass:[LightBoxCell class] forCellWithReuseIdentifier:@"lightbox"];
    self.lightbox_collection.backgroundColor = [UIColor whiteColor];
    self.lightbox_collection.allowsMultipleSelection = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.lightbox_collection.translatesAutoresizingMaskIntoConstraints = NO;
    
    
    //Other stuff
    _setupAnimationBtn = [CustomViews buttonWithStringAndOuterBorder:@"Set Animation Group"];
    
    _slider = [CustomViews sliderBar];
    [_slider addTarget:self action:@selector(lightValueChange:) forControlEvents:UIControlEventTouchUpInside];
    _slider.minimumValue = SLIDERMINVALUE;
    _slider.maximumValue = SLIDERMAXVALUE;
    _slider.continuous = YES;
    _slider.value = SLIDERSTARTVALUE;
    
    _repeat = [CustomViews customLabel];
    _repeat.font = [UIFont systemFontOfSize:32];
    _repeat.text = @"Repeat?";
    _repeat.textAlignment = NSTextAlignmentCenter;
    
    _sliderNumber = [CustomViews customLabel];
    _sliderNumber.font = [UIFont systemFontOfSize:32];
    _sliderNumber.text = [NSString stringWithFormat:@"Value: %i", SLIDERSTARTVALUE];
    _sliderNumber.textAlignment = NSTextAlignmentCenter;
    
    _doItbtn = [CustomViews buttonWithStringAndOuterBorder:@"Do it to it!"];
    [_doItbtn addTarget:self action:@selector(justDoItClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_setupAnimationBtn];
    [self.view addSubview:_lightbox_collection];
    [self.view addSubview:_slider];
    [self.view addSubview:_repeat];
    [self.view addSubview:_doItbtn];
    [self.view addSubview:_sliderNumber];
    
    //do it button
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_doItbtn attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:-20.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_doItbtn attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-150.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_doItbtn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:.3 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_doItbtn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:.05 constant:0.0]];
    
    //Slider
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_slider attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:20.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_slider attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-150.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_slider attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:.3 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_slider attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:.05 constant:0.0]];
    
    //Repeat Label
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_repeat attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.slider attribute:NSLayoutAttributeBottom multiplier:1.0 constant:10.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_repeat attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.slider attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_repeat attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.slider attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_repeat attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:40.0]];
    
    
    //Repeat Label
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_sliderNumber attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.slider attribute:NSLayoutAttributeTop multiplier:1.0 constant:-10.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_sliderNumber attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.slider attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_sliderNumber attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.slider attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_sliderNumber attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:40.0]];
    
    
    //Lightboxcollection
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_lightbox_collection attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_lightbox_collection attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_lightbox_collection attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:.65 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_lightbox_collection attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:.5 constant:0.0]];
    
    //Btn animation
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_setupAnimationBtn attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:20.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_setupAnimationBtn attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:20.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_setupAnimationBtn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:.25 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_setupAnimationBtn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:.05 constant:0.0]];
    
    
    
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    LightBoxCell *cell = (LightBoxCell*)[collectionView cellForItemAtIndexPath:indexPath];
    BlockDetailView *detailView = [[BlockDetailView alloc] initWithLightBox:cell.lightBox];
    
    [self popDetailViewIn:detailView];
    
}

-(void)popDetailViewIn:(UIView*)detailView{
    detailView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:detailView];
    
    //Lightboxcollection
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:detailView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:detailView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:detailView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:.7 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:detailView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:.6 constant:0.0]];
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 5;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 9;
    // return 1 + section; // for stairstep
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)aCollectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LightBoxCell *cell = (LightBoxCell *)[self.lightbox_collection dequeueReusableCellWithReuseIdentifier:@"lightbox" forIndexPath:indexPath];
    
    [cell setupCellWithBox:nil];
    cell.number.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row+1];
    
    return cell;
}
@end
