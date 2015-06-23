//
//  VKCollectionViewLayout.h
//  VKWaterfall
//
//  Created by mac on 6/23/15.
//  Copyright (c) 2015 VKan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    Vertical,
    Horizontal,
} VKLayoutDirection;

@interface VKCollectionViewLayout : UICollectionViewLayout

//垂直时,列数
@property (nonatomic, assign) NSInteger colOfPortraitNum;
//水平时,列数
@property (nonatomic, assign) NSInteger colOfLandscape;
//滚动方向
@property (nonatomic, assign) VKLayoutDirection layoutDirection;

@end
