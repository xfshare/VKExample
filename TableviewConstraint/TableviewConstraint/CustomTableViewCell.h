//
//  CustomTableViewCell.h
//  TableviewConstraint
//
//  Created by mac on 6/19/15.
//  Copyright (c) 2015 VKan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintBtn2Superview;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constrainBtn2Btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn1;

- (void)hiddenBtn1;
@end
