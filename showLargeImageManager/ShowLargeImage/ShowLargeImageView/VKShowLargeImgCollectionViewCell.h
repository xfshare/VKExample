//
//  VKShowLargeImgCollectionViewCell.h
//  ShowLargeImage
//
//  Created by mac on 6/17/15.
//  Copyright (c) 2015 xfshare. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VKShowLargeImgData.h"

@protocol VKShowLargeImgCollectionViewCellDelegate <NSObject>

- (void)dismisSelfView;

@end

@interface VKShowLargeImgCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) VKShowLargeImgData *data;
@property (nonatomic, assign) id<VKShowLargeImgCollectionViewCellDelegate> delegate;
@end
