//
//  postViewController.m
//  instagram-lauren
//
//  Created by laurenjle on 7/10/19.
//  Copyright © 2019 codepath. All rights reserved.
//

#import "PostViewController.h"
#import "homeScreenViewController.h"

@interface PostViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *aboutToPostImage;
@property (weak, nonatomic) IBOutlet UILabel *captionLabel;

@end

@implementation PostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.aboutToPostImage.image = _chosenImage; //self.aboutToPostImage.image = self.chosenImage;
    // Do any additional setup after loading the view.
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
