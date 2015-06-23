//
//  ViewController.m
//  VKWaterfall
//
//  Created by mac on 6/23/15.
//  Copyright (c) 2015 VKan. All rights reserved.
//

#import "ViewController.h"
#import "VKCollectionViewCell.h"
#import "VKCollectionViewLayout.h"
#import "UIColor+RandomFlatColors.h"
static NSString *ReuseIdentifier = @"KYTilePhotoCell";

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *vkCollectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    VKCollectionViewLayout *layout = [[VKCollectionViewLayout alloc] init];
    layout.colOfPortraitNum = 3;
    layout.colOfLandscape = 6;
    
//    [self.vkCollectionView registerClass:[VKCollectionViewCell class] forCellWithReuseIdentifier:ReuseIdentifier];
    [self.vkCollectionView registerNib:[UINib nibWithNibName:@"VKCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:ReuseIdentifier];
    
    self.vkCollectionView.delegate = self;
    self.vkCollectionView.dataSource = self;
    [self.vkCollectionView setCollectionViewLayout:layout];
    

}

#pragma mark -- RotateToReLayout
-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    
    VKCollectionViewLayout *layout = (VKCollectionViewLayout *)self.vkCollectionView.collectionViewLayout;
    [layout invalidateLayout];
    
}


#pragma mark -- UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 100;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    VKCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ReuseIdentifier forIndexPath:indexPath];
        cell.numLab.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    cell.backgroundColor = [UIColor randomFlatColor];

    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"click = %@",indexPath);
}
@end
