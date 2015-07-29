//
//  ViewController.m
//  VKCamera
//
//  Created by mac on 15/7/28.
//  Copyright (c) 2015年 VKan. All rights reserved.
//

#import "ViewController.h"
#import "VKNextViewController.h"

@interface ViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIAlertViewDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)openCamera:(id)sender {
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        UIImagePickerController *pickvc = [[UIImagePickerController alloc] init];
        pickvc.sourceType = UIImagePickerControllerSourceTypeCamera;
        pickvc.delegate = self;
        [self presentViewController:pickvc animated:YES completion:NULL];
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"没有课拍照设备,歇会吧~~~" delegate:self cancelButtonTitle:@"知道啦" otherButtonTitles:@"Go 相册", nil];
        [alert show];
    }
    
}
- (IBAction)openAlbumAction:(id)sender {
    UIImagePickerController *pickvc = [[UIImagePickerController alloc] init];
    pickvc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    pickvc.delegate = self;
    [self presentViewController:pickvc animated:YES completion:NULL];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1){
        UIImagePickerController *pickvc = [[UIImagePickerController alloc] init];
        pickvc.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        pickvc.delegate = self;
        [self presentViewController:pickvc animated:YES completion:NULL];
    }
}
- (IBAction)nextVCAction:(id)sender {
    
    VKNextViewController *next = [[VKNextViewController alloc] initWithNibName:@"VKNextViewController" bundle:nil];
    [self presentViewController:next animated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo{
    
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.imageView.image = image;
    
    NSLog(@"%@",editingInfo);

    [picker dismissViewControllerAnimated:YES completion:NULL];
}

//- (BOOL)shouldAutorotate {
//    return YES;
//}
//
//- (NSUInteger)supportedInterfaceOrientations {
//    return UIInterfaceOrientationMaskAll;
//}
@end
