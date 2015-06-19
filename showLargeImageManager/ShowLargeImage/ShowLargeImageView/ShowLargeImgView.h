//
//  ShowLargeImgView.h
//  AGATE_Max
//
//  Created by mac on 15/3/4.
//  Copyright (c) 2015年 mac. All rights reserved.
//


/**
 *  1.显示大图时,隐藏状态栏,需要实现 delegate,同时在 vc 界面实现
 *     - (UIStatusBarStyle)preferredStatusBarStyle  - (BOOL)prefersStatusBarHidden 使用setNeedsStatusBarAppearanceUpdate 更新状态栏
 *  2.不是默认从第一张图片进行显示,可以直接使用 - (instancetype)initWithImages:(NSArray *)imageArr firstDisplayPath:(NSUInteger)firstDisplay 即可,或者
 *     - (instancetype)initWithImages:(NSArray *)imageArr; 和 firstDisplayNo 赋值 并用
 */

#import <UIKit/UIKit.h>

@protocol ShowLargeImgViewDelegate <NSObject>

- (void)vk_ShowLargeImgViewDisappear;

@end

@interface ShowLargeImgView : UIView
@property (nonatomic,assign)NSUInteger firstDisplayNo;
@property (assign,nonatomic)id<ShowLargeImgViewDelegate>delegate;
- (instancetype)initWithImages:(NSArray *)imageArr;
- (instancetype)initWithImages:(NSArray *)imageArr firstDisplayPath:(NSUInteger)firstDisplay;
@end
