//
//  ViewController.m
//  instagram-lauren
//
//  Created by laurenjle on 7/8/19.
//  Copyright © 2019 codepath. All rights reserved.
//

#import "ViewController.h"
#import "Parse/Parse.h"
#import "AppDelegate.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;


@end

@implementation ViewController
@synthesize loginLettersView; //image of login screen

- (void)viewDidLoad {
    //for image of login screen
    UIImage *image1 = [UIImage imageNamed:@"letters_login.jpg"];
    [loginLettersView setImage:image1];
                       
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}


- (void)registerUser {
    // initialize a user object
    PFUser *newUser = [PFUser user];
    
    // set user properties
    newUser.username = self.usernameField.text;
    newUser.email = self.emailField.text; //when testing, be sure to include @___.com
    newUser.password = self.passwordField.text;
    
    // call sign up function on the object
    //checks if new account can be successfully made
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * error) {
        if (error != nil) {
            NSLog(@"Error: %@", error.localizedDescription);
        } else {
            NSLog(@"User registered successfully");
            
            // manually segue to logged in view
        }
    }];
}

- (void)loginUser {
    NSString *username = self.usernameField.text;
    NSString *password = self.passwordField.text;
    
    //check if user login was valid based on username and password
    [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser * user, NSError *  error) {
        if (error != nil) {
            NSLog(@"User log in failed: %@", error.localizedDescription);
        } else {
            NSLog(@"User logged in successfully");
             // display view controller that needs to shown after successful login
             [self performSegueWithIdentifier:@"loginSegue" sender:nil];
        }
    }];
}
- (IBAction)tapLogin:(id)sender {
    [self loginUser];
}
- (IBAction)tapSignup:(id)sender {
    [self registerUser];
}

//dismissing keyboard on login screen
- (IBAction)onTapLogin:(id)sender {
    NSLog(@"hello");
    [self.view endEditing:YES];
}


@end
