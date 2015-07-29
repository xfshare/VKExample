//
//  UIImagePickerController+Nonrotating.m
//  VKCamera
//
//  Created by mac on 15/7/29.
//  Copyright (c) 2015年 VKan. All rights reserved.
//

#import "UIImagePickerController+Nonrotating.h"

@implementation UIImagePickerController (Nonrotating)

- (BOOL)shouldAutorotate {
    return YES;
}
- (NSUInteger)supportedInterfaceOrientations {
    if (self.sourceType == UIImagePickerControllerSourceTypeCamera) {
        return UIInterfaceOrientationMaskPortrait;
    }
    return UIInterfaceOrientationMaskAll;
}
@end
