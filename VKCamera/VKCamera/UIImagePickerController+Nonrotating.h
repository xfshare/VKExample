//
//  UIImagePickerController+Nonrotating.h
//  VKCamera
//
//  Created by mac on 15/7/29.
//  Copyright (c) 2015年 VKan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImagePickerController (Nonrotating)
- (BOOL)shouldAutorotate;
- (NSUInteger)supportedInterfaceOrientations;
@end
