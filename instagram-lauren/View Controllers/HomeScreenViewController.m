//
//  HomeScreenViewController.m
//  instagram-lauren
//
//  Created by laurenjle on 7/11/19.
//  Copyright © 2019 codepath. All rights reserved.
//

#import "HomeScreenViewController.h"
#import "ViewController.h"
#import "Parse/Parse.h"
#import "AppDelegate.h"
#import "Post.h"
#import "HomeScreenViewController.h"
#import <UIKit/UIKit.h> //needed for accessing camera
#import "PostViewController.h"
#import "PostCell.h"

@interface HomeScreenViewController () <UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (strong, nonatomic) NSArray *myPosts;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation HomeScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    // Do any additional setup after loading the view.
    // construct PFQuery
    
    PFQuery *postQuery = [Post query];
    [postQuery orderByDescending:@"createdAt"];
    [postQuery includeKey:@"author"];
    postQuery.limit = 20;
    
    //display posts in home screen
    // fetch data asynchronously
    [postQuery findObjectsInBackgroundWithBlock:^(NSArray<Post *> * _Nullable posts, NSError * _Nullable error) {
        if (posts) {
            // do something with the data fetched
            self.myPosts = posts;
            [self.tableView reloadData];
        }
        else {
            // handle error
        }
    }];
    
    
}


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
}
    
-(IBAction)tapCameraButtonToCompose:(id)sender {
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
        
        // Dismiss UIImagePickerController and segue to PostViewController
        
        [self dismissViewControllerAnimated:YES completion: ^(){[self performSegueWithIdentifier:@"postSegue" sender:nil];}];
    
    }
    
    
    
    
    //sends selected image from the UIImagePickerController (which occurs when the camera button is clicked) to the PostViewController
    
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
        
        if([@"postSegue" isEqualToString:segue.identifier]) {
            
            UINavigationController *navigationController = [segue destinationViewController];
            
            //create an instance of the PostViewController
            
            PostViewController *controller = (PostViewController*)navigationController.topViewController;
            
            //set controller's chosenImage to the selected image (chosen from imagePickerController)
            
            controller.chosenImage = self.selectedImage;
            
        }
}
    
    
    //
    
//-(nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
//
//
//    //reuse cells
//    PostCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PostCell"];
//    Post *post = self.myPosts[indexPath.row];
//
//    cell.post = post;
//    //outlets and data
//    cell.captionLabel.text = post.caption;
//    cell.usernameLabel.text = post.author.username;
//    cell.likeCount.text = post.likeCount;
//    //do we need to set pic here?
//    PFFileObject *i = post.image;
//    [i getDataInBackgroundWithBlock:^(NSData * _Nullable data, NSError * _Nullable error) {
//        cell.postImageView.image = [UIImage imageWithData:data];
//    }];
//
//    //dont know why cant access any PostCell properties
//    return cell;
//
//}
//-(NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return self.myPosts.count;
//}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
        //reuse cells
        PostCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PostCell"];
        Post *post = self.myPosts[indexPath.row];
    
        cell.post = post;
        //outlets and data
        cell.captionLabel.text = post.caption;
        cell.usernameLabel.text = post.author.username;
    
        //make sure to convert number into NSString, otherwise posts won't show up in home timeline
        cell.likeCount.text = [NSString stringWithFormat:@"%d",post.likeCount];
    
        // create reference to post image of type PFFileObject
        PFFileObject *imagePF = post.image;
        //get data from PFFileObject and turn it into an UIImage
        [imagePF getDataInBackgroundWithBlock:^(NSData * _Nullable data, NSError * _Nullable error) {
            cell.postImageView.image = [UIImage imageWithData:data];
        }];
    
        //dont know why cant access any PostCell properties
        return cell;
    
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.myPosts.count;
}
@end
