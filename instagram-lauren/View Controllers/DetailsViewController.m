//
//  DetailsViewController.m
//  instagram-lauren
//
//  Created by laurenjle on 7/11/19.
//  Copyright © 2019 codepath. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.datePosted.text = self.timePostWasMade;
    self.captionBoxLabel.text=self.captionBox;
    
    //get more than 1 line for caption
    _captionBoxLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.captionBoxLabel.numberOfLines=0;
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
