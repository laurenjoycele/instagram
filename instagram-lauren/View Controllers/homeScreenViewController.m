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





@end
