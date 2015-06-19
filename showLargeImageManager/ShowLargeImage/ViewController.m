//
//  ViewController.m
//  ShowLargeImage
//
//  Created by mac on 15/4/22.
//  Copyright (c) 2015年 xfshare. All rights reserved.
//

#import "ViewController.h"
#import "ShowLargeImgView.h"
#import <SDImageCache.h>
@interface ViewController ()<ShowLargeImgViewDelegate>
{
    BOOL isHiddenStatus;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


#pragma mark method
- (IBAction)showImagesAction:(id)sender {
    __unused ShowLargeImgView *showLarge =[[ShowLargeImgView alloc]initWithImages:@[@{@"url":
                                                                                          @"http://c.hiphotos.baidu.com/image/pic/item/f3d3572c11dfa9ec78e256df60d0f703908fc12e.jpg"},
                                                                                    @{@"url":
                                                                                          @"http://a.hiphotos.baidu.com/image/pic/item/4b90f603738da977e9bd86e3b251f8198718e36c.jpg"},
                                                                                    @{@"url":
                                                                                          @"http://f.hiphotos.baidu.com/image/pic/item/29381f30e924b8994cae79f06c061d950b7bf66c.jpg"},
                                                                                    @{@"url":
                                                                                          @"http://a.hiphotos.baidu.com/image/pic/item/f11f3a292df5e0fef9238ac95e6034a85edf723a.jpg"},
                                                                                    @{@"url":
                                                                                          @"http://a.hiphotos.baidu.com/image/pic/item/96dda144ad345982ca2423030ff431adcaef84f1.jpg"},
                                                                                    @{@"url":
                                                                                          @"http://a.hiphotos.baidu.com/image/pic/item/8d5494eef01f3a294d7fd35d9a25bc315d607ce9.jpg"},
                                                                                    @{@"url":
                                                                                          @"http://g.hiphotos.baidu.com/image/pic/item/8326cffc1e178a82b7f4bb31f503738da877e853.jpg"},
                                                                                    @{@"url":
                                                                                          @"http://h.hiphotos.baidu.com/image/pic/item/aec379310a55b319ec6546e440a98226cefc1786.jpg"},
                                                                                    @{@"url":
                                                                                          @"http://b.hiphotos.baidu.com/image/pic/item/3ac79f3df8dcd100dbba92b6718b4710b9122f06.jpg"}, ]
                                                                 firstDisplayPath:9];
//    showLarge.delegate = self;
    showLarge.alpha = 0.0;
    [self.view addSubview:showLarge];
//    isHiddenStatus = YES;
//    [self setNeedsStatusBarAppearanceUpdate];
    [UIView animateWithDuration:0.2
                          delay:0.0
                        options:UIViewAnimationOptionShowHideTransitionViews
                     animations:^{
                         showLarge.alpha = 1.0;
                     } completion:^(BOOL finished) {
                         
                     }];
    
}
- (IBAction)showAction:(UIButton *)sender {
    

    
    __unused ShowLargeImgView *showLarge =[[ShowLargeImgView alloc]initWithImages:@[@{@"url":
                                                                                          @"http://b.hiphotos.baidu.com/image/pic/item/3ac79f3df8dcd100dbba92b6718b4710b9122f06.jpg"},]];
    showLarge.delegate = self;
    [self.view addSubview:showLarge];
    isHiddenStatus = YES;
    [self setNeedsStatusBarAppearanceUpdate];
    
}

#pragma mark delegate
- (void)vk_ShowLargeImgViewDisappear{
    isHiddenStatus = NO;
    [self setNeedsStatusBarAppearanceUpdate];

}

#pragma mark statusBar
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleDefault;
}
- (BOOL)prefersStatusBarHidden{
    return isHiddenStatus;
}
@end
