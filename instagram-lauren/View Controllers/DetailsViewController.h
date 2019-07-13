//
//  DetailsViewController.h
//  instagram-lauren
//
//  Created by laurenjle on 7/11/19.
//  Copyright © 2019 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewController : UIViewController
//use text field for multiple lines
@property (weak, nonatomic) IBOutlet UITextField *datePosted;

@property(strong, nonatomic) NSString *timePostWasMade;


@property (weak, nonatomic) IBOutlet UILabel *captionBoxLabel;
@property(strong, nonatomic) NSString *captionBox;

@end

NS_ASSUME_NONNULL_END
