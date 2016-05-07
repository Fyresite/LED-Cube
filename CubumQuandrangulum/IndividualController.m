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
#import "QeueList.h"

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
        
        
        
        _number = [CustomViews customLabel];
        
        [self addSubview:_number];
        
        
        //Everthing is related to the column btn
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_number attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_number attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_number attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_number attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0.0]];
    }
    return self;
}

@end

@interface IndividualController()

@property UILabel *sliderNumber;

@end

@implementation IndividualController{
    AppDelegate *sharedDelegate;
    NSMutableArray *collection_data;
    
    LightBoxCell *current_clicked_cell;
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
    
    _sliderNumber.text = [NSString stringWithFormat:@"%i",[[NSNumber numberWithFloat:value] intValue]];
    
}
-(void)justDoItClicked:(UIButton*)sender{
    
}
-(void)setupController{
    //Layout and collection
    GridLayout *layout = [[GridLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(10.0f, 10.0f, 10.0f, 10.0f);
    layout.minimumInteritemSpacing = 20.0f;
    layout.alignment = GridRowAlignmentCenter;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
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
    [_slider addTarget:self action:@selector(lightValueChange:) forControlEvents:UIControlEventValueChanged];
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
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_doItbtn attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-80.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_doItbtn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:.3 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_doItbtn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:.05 constant:0.0]];
    
    //Slider
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_slider attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:20.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_slider attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-80.0]];
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
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_lightbox_collection attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:-30.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_lightbox_collection attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:.65 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_lightbox_collection attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:.5 constant:0.0]];
    
    //Btn animation
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_setupAnimationBtn attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:20.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_setupAnimationBtn attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:20.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_setupAnimationBtn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:.25 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_setupAnimationBtn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:.05 constant:0.0]];
    
    
    
    
}


-(void)addQeueAdderView:(UIButton*)sender{
    
    BlockDetailView *block = [[BlockDetailView alloc] initWithLightBox:current_clicked_cell.lightBox];
    [self popQeueViewIn:block];
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    LightBoxCell *cell = (LightBoxCell*)[collectionView cellForItemAtIndexPath:indexPath];
    QeueList *qList = [[QeueList alloc] initWithLightBox:cell.lightBox];
    [qList.select addTarget:self action:@selector(addQeueAdderView:) forControlEvents:UIControlEventTouchUpInside];
    [self popQeueViewIn:qList];
    
    current_clicked_cell = cell;
    
}

-(void)popQeueViewIn:(UIView*)detailView{
    detailView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:detailView];
    
    //Lightboxcollection
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:detailView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:detailView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:detailView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:.7 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:detailView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:.75 constant:0.0]];
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [sharedDelegate.columns count];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    LightColumn *col = [sharedDelegate.columns objectAtIndex:section];
    return col.lightBoxes.count;
    // return 1 + section; // for stairstep
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)aCollectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LightColumn *current_column = [sharedDelegate.columns objectAtIndex:indexPath.section];
    LightBox *currentBox;
        currentBox = [current_column.lightBoxes objectAtIndex:current_column.lightBoxes.count-indexPath.row-1];

    
    LightBoxCell *cell = (LightBoxCell *)[self.lightbox_collection dequeueReusableCellWithReuseIdentifier:@"lightbox" forIndexPath:indexPath];
    
    cell.lightBox = currentBox;
    cell.number.text = [NSString stringWithFormat:@"%i",cell.lightBox.number+1];
    
    return cell;
}
@end
