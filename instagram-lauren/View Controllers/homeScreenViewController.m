//
//  homeScreenViewController.m
//  instagram-lauren
//
//  Created by laurenjle on 7/9/19.
//  Copyright © 2019 codepath. All rights reserved.
//
#import "ViewController.h"
#import "Parse/Parse.h"
#import "AppDelegate.h"
#import "homeScreenViewController.h"
#import <UIKit/UIKit.h> //needed for accessing camera
#import "postViewController.h"

//needed for accessing camera (taking a photo & selecting photo from camera roll)
@interface FeedViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@end

@implementation homeScreenViewController
- (IBAction)tapLogout:(id)sender {
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
        // need explanation for this
        AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        //create an instance of UIStoryboard
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        //create an instance of ViewController (the first screen (login screen) users see)
        ViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
        //takes user back to login screen (ViewController) from home screen when user taps on logout button
        appDelegate.window.rootViewController = loginViewController;
    }];
};
- (IBAction)tapCameraButtonToCompose:(id)sender {
    //instantiate UIImagePickerController
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;
    //imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:imagePickerVC animated:YES completion:nil];
    
    //check if camera is supported on device
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    else {
        NSLog(@"Camera 🚫 available so we will use photo library instead");
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
}

//implement delegate method
//When the user finishes taking the picture, UIImagePickerController returns a dictionary that contains the image and some other meta data
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    // Get the image captured by the UIImagePickerController
    UIImage *originalImage = info[UIImagePickerControllerOriginalImage];
    UIImage *editedImage = info[UIImagePickerControllerEditedImage];
    
    
    // to pass the selected image to the post view controller, set
    self.selectedImage = originalImage;
    // Dismiss UIImagePickerController to go back to your original view controller
    [self dismissViewControllerAnimated:YES completion: ^(){[self performSegueWithIdentifier:@"postSegue" sender:nil];}];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([@"postSegue" isEqualToString:segue.identifier]) {
        UINavigationController *navigationController = [segue destinationViewController];
        PostViewController *controller = (PostViewController*)navigationController.topViewController;
        controller.chosenImage = self.selectedImage;
    }
}









@end
