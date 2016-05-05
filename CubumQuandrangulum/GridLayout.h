//
//  GridLayout.h
//  CubumQuandrangulum
//
//  Created by Travis on 5/5/16.
//  Copyright © 2016 Fyresite. All rights reserved.
//

@import UIKit;

typedef enum
{
    GridRowAlignmentNone,
    GridRowAlignmentTop,
    GridRowAlignmentCenter,
    GridRowAlignmentBottom,
} GridRowAlignment;

@interface GridLayout : UICollectionViewFlowLayout

@property (nonatomic) GridRowAlignment alignment;

/*
 // If you want to subclass UICollectionViewLayout directly add these properties
 @property (nonatomic) CGSize footerReferenceSize;
 @property (nonatomic) CGSize headerReferenceSize;
 @property (nonatomic) CGSize itemSize;
 @property (nonatomic) CGFloat minimumInteritemSpacing;
 @property (nonatomic) CGFloat minimumLineSpacing;
 @property (nonatomic) UICollectionViewScrollDirection scrollDirection;
 @property (nonatomic) UIEdgeInsets sectionInset;
 */
@end
