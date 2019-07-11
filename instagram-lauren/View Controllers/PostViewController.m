//
//  postViewController.m
//  instagram-lauren
//
//  Created by laurenjle on 7/10/19.
//  Copyright © 2019 codepath. All rights reserved.
//

#import "PostViewController.h"
#import "HomeScreenViewController.h"
#import "Post.h"

@interface PostViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *aboutToPostImage;
@property (weak, nonatomic) IBOutlet UITextField *captionField;



@end

@implementation PostViewController
- (UIImage *)resizeImage:(UIImage *)image withSize:(CGSize)size {
    UIImageView *resizeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    
    resizeImageView.contentMode = UIViewContentModeScaleAspectFill;
    resizeImageView.image = image;
    
    UIGraphicsBeginImageContext(size);
    [resizeImageView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.aboutToPostImage.image = self.chosenImage;
    // Do any additional setup after loading the view.
    
}
- (IBAction)tapShare:(id)sender {
    [Post postUserImage:[self resizeImage:self.aboutToPostImage.image withSize:CGSizeMake(200, 200)] withCaption:self.captionField.text withCompletion:^(BOOL succeeded, NSError * _Nullable error) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
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
