//
//  VKCollectionViewLayout.m
//  VKWaterfall
//
//  Created by mac on 6/23/15.
//  Copyright (c) 2015 VKan. All rights reserved.
//

#import "VKCollectionViewLayout.h"
#define LayoutVertical   self.layoutDirection == Vertical

@interface VKCollectionViewLayout()
@property (nonatomic,assign) NSUInteger colCount;
@property (nonatomic,strong) NSMutableArray *colHeights;//每列的高度
@property (nonatomic,strong) NSMutableArray *itemsAttributes;//所有 item Attributes

@end

@implementation VKCollectionViewLayout

- (void)prepareLayout{

    //根据屏幕方向确定总共需要的列数
    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
    if (orientation == UIDeviceOrientationLandscapeLeft | orientation ==  UIDeviceOrientationLandscapeRight){
        self.colCount = self.colOfLandscape;
    }else{
        self.colCount = self.colOfPortraitNum;
    }
    
    //确定 item 个数
    NSUInteger items = [[self collectionView] numberOfItemsInSection:0];
    
    //初始化 colHeights itemsAttributes
    self.colHeights = [NSMutableArray arrayWithCapacity:self.colCount];
    self.itemsAttributes = [NSMutableArray arrayWithCapacity:items];
    
    for (NSInteger i = 0; i< self.colCount; i ++) {
        [self.colHeights addObject:@(0)];
    }
    
    
    for (NSUInteger i = 0; i < items; i ++) {
        
        //找到最短的列
        NSUInteger shotIndex = [self findShortestCol];
        
        //x
        NSUInteger origin_x = LayoutVertical ? shotIndex * [self colWidth]:[self.colHeights[shotIndex] integerValue];
        
        //y
        NSUInteger origin_y = LayoutVertical ? [self.colHeights[shotIndex] integerValue]: shotIndex * [self colWidth];
        
        //width
        NSUInteger size_width = [self colWidth];
        
        //height
        NSUInteger size_height = size_width + arc4random() %40 * 2;
        
        self.colHeights[shotIndex] = @(origin_y + size_height);
        
        //给attributes.frame 赋值，并存入 self.itemsAttributes
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        attributes.frame = CGRectMake(origin_x, origin_y, size_width, size_height);
        [self.itemsAttributes addObject:attributes];
        
    }
    
    
    
}


- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
    
    return self.itemsAttributes;
}


- (CGSize)collectionViewContentSize{
    CGSize size = self.collectionView.bounds.size;
    NSUInteger longestIndex = [self findLongestCol];
    float colMax = [self.colHeights[longestIndex] floatValue];
    if (LayoutVertical) {
        size.height = colMax;
    }
    else{
        size.width = colMax;
    }
    return size;
}


- (float)colWidth{

    return LayoutVertical? roundf(CGRectGetWidth(self.collectionView.bounds) / self.colCount):roundf(CGRectGetHeight(self.collectionView.bounds) / self.colCount);
}

//找到最短列
- (NSUInteger)findShortestCol{
    NSUInteger shortestIndex = 0;
    CGFloat shortestValue = MAXFLOAT;
    
    NSUInteger index = 0;
    for (NSNumber *colNumber in self.colHeights) {
        if ([colNumber floatValue] < shortestValue) {
            shortestValue = [colNumber floatValue];
            shortestIndex = index;
        }
        index ++;
    }
    return shortestIndex;
}

//找到最长列
- (NSUInteger)findLongestCol{
    NSUInteger longestIndex = 0;
    CGFloat longestValue = 0;
    
    NSUInteger index = 0;
    for (NSNumber *colNumber in self.colHeights) {
        if ([colNumber floatValue] > longestValue) {
            longestValue = [colNumber floatValue];
            longestIndex = index;
        }
        index ++;
    }
    return longestIndex;
}


@end
