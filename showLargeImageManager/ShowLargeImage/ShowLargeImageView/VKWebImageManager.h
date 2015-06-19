//
//  VKWebImageManager.h
//  ShowLargeImage
//
//  Created by mac on 15/4/22.
//  Copyright (c) 2015年 xfshare. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^VKDownLoadFinish)(UIImage *image);

@interface VKWebImageManager : NSObject

+ (void)setDownLoadProgressImageWithUrl:(NSString *)url OnImageView:(UIImageView *)imageView finish:(VKDownLoadFinish)finish;
@end
