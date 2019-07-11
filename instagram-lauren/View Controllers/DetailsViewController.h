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
@property (weak, nonatomic) IBOutlet UILabel *datePosted;
@property(strong, nonatomic) NSString *timePostWasMade;
@end

NS_ASSUME_NONNULL_END
