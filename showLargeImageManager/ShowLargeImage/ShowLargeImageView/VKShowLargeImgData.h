//
//  VKShowLargeImgData.h
//  ShowLargeImage
//
//  Created by mac on 6/17/15.
//  Copyright (c) 2015 xfshare. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VKShowLargeImgData : NSObject
@property (nonatomic, strong) NSString *imgUrl;

+ (NSArray *)getStandLargeImgDataInfo:(NSArray *)arrinfo;
@end
