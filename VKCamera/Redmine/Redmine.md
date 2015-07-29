#Only横屏APP,使用ImagePickerController

###保证App最少支持	Portrait

>`The UIImagePickerController class supports portrait mode only`. This class is intended to be used as-is and does not support subclassing. The view hierarchy for this class is private and must not be modified, with one exception. You can assign a custom view to the cameraOverlayView property and use that view to present additional information or manage the interactions between the camera interface and your code.

方法 一
	![方法1](./01.png)

方法 二	
	
	appdelegate.m
	
	- (NSUInteger)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
	{    
	    return UIInterfaceOrientationMaskAll;
	}
	


###Category

ViewController Category
	
	//-----------.h-----------
	@interface UIViewController (VKVCCategory)
	- (BOOL)shouldAutorotate;
	- (NSUInteger)supportedInterfaceOrientations;
	@end
	
	//-----------.m-----------
	#import "UIViewController+VKVCCategory.h"

	@implementation UIViewController (VKVCCategory)
	
	- (BOOL)shouldAutorotate {
	    return YES;
	}
	
	- (NSUInteger)supportedInterfaceOrientations {
	    return UIInterfaceOrientationMaskLandscape;
	}
	@end
	
ImagePickerController Category
		
	//-----------.h-----------
	@interface UIImagePickerController (Nonrotating)
	- (BOOL)shouldAutorotate;
	- (NSUInteger)supportedInterfaceOrientations;
	@end

	//-----------.m-----------
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
	
Tips:使用PCH直接import

cocos2dx,RootViewController.mm,更改支持的屏幕方向
		