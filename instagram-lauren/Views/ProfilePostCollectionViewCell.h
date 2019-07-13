//
//  ProfilePostCollectionViewCell.h
//  instagram-lauren
//
//  Created by laurenjle on 7/12/19.
//  Copyright © 2019 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"

NS_ASSUME_NONNULL_BEGIN

@interface ProfilePostCollectionViewCell : UICollectionViewCell
@property (strong, nonatomic) Post *post;
@property (weak, nonatomic) IBOutlet UIImageView *ownImage;

@end

NS_ASSUME_NONNULL_END
