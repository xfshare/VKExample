//
//  VKShowLargeImgData.m
//  ShowLargeImage
//
//  Created by mac on 6/17/15.
//  Copyright (c) 2015 xfshare. All rights reserved.
//

#import "VKShowLargeImgData.h"

@implementation VKShowLargeImgData
+ (NSArray *)getStandLargeImgDataInfo:(NSArray *)arrinfo{
    NSMutableArray *mutArr = [NSMutableArray array];
    for (NSDictionary *dic in arrinfo) {
        VKShowLargeImgData *data = [[VKShowLargeImgData alloc] init];
        data.imgUrl = [dic objectForKey:@"url"];
        [mutArr addObject:data];
    }
    return mutArr;
}
@end
