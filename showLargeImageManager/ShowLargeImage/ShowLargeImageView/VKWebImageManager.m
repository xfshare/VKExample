//
//  VKWebImageManager.m
//  ShowLargeImage
//
//  Created by mac on 15/4/22.
//  Copyright (c) 2015年 xfshare. All rights reserved.
//

#import "VKWebImageManager.h"

#import <UIImageView+WebCache.h>
#import <MBProgressHUD.h>
@implementation VKWebImageManager
+ (void)setDownLoadProgressImageWithUrl:(NSString *)url OnImageView:(UIImageView *)imageView finish:(VKDownLoadFinish)finish{
    
    MBProgressHUD *HUB;
    if (!HUB) {
        HUB = [[MBProgressHUD alloc] initWithView:imageView];
        [imageView addSubview:HUB];
    }
    HUB.mode = MBProgressHUDModeAnnularDeterminate;

    
    NSURL *imgUrl = [NSURL URLWithString:url];
    UIImage *placeHolderImg = [UIImage imageNamed:@"no_pic"];
    
    [imageView sd_setImageWithURL:imgUrl
                 placeholderImage:placeHolderImg
                          options:SDWebImageRetryFailed
                         progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                             HUB.progress = receivedSize * 1.0 / expectedSize;
                             if (HUB.progress > 0) {
                                 [HUB show:YES];
                             }
                             HUB.labelText = [NSString stringWithFormat:@"%ld﹪",(long)(HUB.progress * 100)];
                             NSLog(@"大图下载%lf",HUB.progress);

                         }
                        completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                            
                            finish(image);
                            
                            if (image) {
                                imageView.image = image;
                                HUB.progress = 1;
                                
                                [HUB hide: YES];
                                [HUB removeFromSuperview];
                            }
                            
                            if (error) {
                                    [HUB hide: YES];
                                    [HUB removeFromSuperview];
                            }


                            
                        }];
}
@end
