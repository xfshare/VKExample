//
//  ShowLargeImgView.m
//  AGATE_Max
//
//  Created by mac on 15/3/4.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ShowLargeImgView.h"
#import "VKWebImageManager.h"
#import "VKShowLargeImgCollectionViewCell.h"
#import "VKShowLargeImgData.h"

#define COLLECTION_CELL_IDENTIFIER @"VKShowLargeImgCollectionViewCell"

@interface ShowLargeImgView() <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,VKShowLargeImgCollectionViewCellDelegate>
{
    NSArray *allImgsInfoArr;
    UILabel *numLab;
    UICollectionView *collectionView;
}
@end

@implementation ShowLargeImgView

#pragma mark -
#pragma mark 显示大图
- (instancetype)initWithImages:(NSArray *)imageArr{
    CGRect frame = CGRectMake(0,
                              0,
                              [UIScreen mainScreen].bounds.size.width,
                              [UIScreen mainScreen].bounds.size.height);
    
    self = [super initWithFrame:frame];
    
    if (self) {
        allImgsInfoArr = [VKShowLargeImgData getStandLargeImgDataInfo:imageArr];
        [self buildCollectionView];
        [self buildDisplayNumView];
    }
    return self;
}

- (instancetype)initWithImages:(NSArray *)imageArr firstDisplayPath:(NSUInteger)firstDisplay{
    CGRect frame = CGRectMake(0,
                              0,
                              [UIScreen mainScreen].bounds.size.width,
                              [UIScreen mainScreen].bounds.size.height);
    
    self = [super initWithFrame:frame];
    
    if (self) {
        allImgsInfoArr = [VKShowLargeImgData getStandLargeImgDataInfo:imageArr];
        self.firstDisplayNo = firstDisplay;
        
        [self buildCollectionView];
        [self buildDisplayNumView];
    }
    return self;
}

#pragma mark - Collection DataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return allImgsInfoArr.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return  1;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionV
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = COLLECTION_CELL_IDENTIFIER;
    VKShowLargeImgCollectionViewCell *cell = [collectionV dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];

    cell.selected = NO;
    cell.data = (VKShowLargeImgData *)[allImgsInfoArr objectAtIndex:indexPath.row];
    cell.delegate = self;
    
    return cell;
}

#pragma mark collection layout delegate
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(UICollectionViewLayout *)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.frame.size;
}
#pragma mark collection delegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSInteger curPageNum = scrollView.contentOffset.x / scrollView.frame.size.width + 1;
    if (curPageNum<1 || curPageNum > allImgsInfoArr.count) {
        
    }
    else{
        numLab.text = [NSString stringWithFormat:@"%ld/%ld",(long)curPageNum,(long)allImgsInfoArr.count];
    }

}

- (void)dismisSelfView{
    if ([_delegate respondsToSelector:@selector(vk_ShowLargeImgViewDisappear)]) {
        [_delegate vk_ShowLargeImgViewDisappear];
    }
    [self removeFromSuperview];
}


#pragma mark -
#pragma mark view
- (void)buildCollectionView{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    [flowLayout setMinimumInteritemSpacing:0];
    [flowLayout setMinimumLineSpacing:0];
    
    collectionView = [[UICollectionView alloc] initWithFrame:self.frame
                                                          collectionViewLayout:flowLayout];
    [collectionView setBackgroundColor:[UIColor blackColor]];
    [collectionView registerClass:[VKShowLargeImgCollectionViewCell class]
       forCellWithReuseIdentifier:COLLECTION_CELL_IDENTIFIER];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.pagingEnabled = YES;
    if(_firstDisplayNo>0 && _firstDisplayNo <= allImgsInfoArr.count){
        collectionView.contentOffset = CGPointMake(CGRectGetWidth(collectionView.frame) * (_firstDisplayNo - 1), 0);
    }
    [self addSubview:collectionView];
}

- (void)buildDisplayNumView{
    UIView *buildDisplayNumBgView = [[UIView alloc] initWithFrame:CGRectMake(20,
                                                                             20,
                                                                             40,
                                                                             30)];
    buildDisplayNumBgView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    buildDisplayNumBgView.layer.cornerRadius = 3.0;
    buildDisplayNumBgView.layer.masksToBounds = YES;
    [self addSubview:buildDisplayNumBgView];
   
    if (!numLab) {
        numLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(buildDisplayNumBgView.frame), CGRectGetHeight(buildDisplayNumBgView.frame))];
        numLab.backgroundColor = [UIColor clearColor];
        numLab.textColor = [UIColor whiteColor];
        numLab.textAlignment = NSTextAlignmentCenter;
        numLab.font = [UIFont systemFontOfSize:15.0];
        if(_firstDisplayNo<= 0 || _firstDisplayNo >allImgsInfoArr.count){
            numLab.text = [NSString stringWithFormat:@"1/%ld",(long)allImgsInfoArr.count];
        }
        else{
            numLab.text = [NSString stringWithFormat:@"%ld/%ld",(unsigned long)_firstDisplayNo,(long)allImgsInfoArr.count];

        }
        
        [buildDisplayNumBgView addSubview:numLab];

    }
    
}

- (void)setFirstDisplayNo:(NSUInteger)firstDisplayNo{
    _firstDisplayNo = firstDisplayNo;
    
    if(_firstDisplayNo>0 && _firstDisplayNo <= allImgsInfoArr.count){
        if (collectionView) {
            collectionView.contentOffset = CGPointMake(CGRectGetWidth(collectionView.frame) * (_firstDisplayNo - 1), 0);
        }
        if (numLab) {
            numLab.text = [NSString stringWithFormat:@"%ld/%ld",(unsigned long)_firstDisplayNo,(long)allImgsInfoArr.count];
            
        }
    }
    
    

}

@end
