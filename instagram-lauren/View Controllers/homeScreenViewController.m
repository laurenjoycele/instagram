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

@implementation homeScreenViewController
- (IBAction)tapLogout:(id)sender {
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
        // PFUser.current() will now be nil
        AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        ViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"ViewController"]; //in twitter this was an instance of LoginViewController
        appDelegate.window.rootViewController = loginViewController;
    }];
}





@end
