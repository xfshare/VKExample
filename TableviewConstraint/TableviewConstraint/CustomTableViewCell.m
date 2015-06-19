//
//  CustomTableViewCell.m
//  TableviewConstraint
//
//  Created by mac on 6/19/15.
//  Copyright (c) 2015 VKan. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)prepareForReuse{
    [super prepareForReuse];
    
    _constrainBtn2Btn1.priority = 999;
    _constraintBtn2Superview.priority = 750;
    _btn1.hidden = NO;
    
}

- (void)hiddenBtn1{
    _btn1.hidden = YES;

    _constraintBtn2Superview.priority = 999;
    _constrainBtn2Btn1.priority = 750;

}


@end
