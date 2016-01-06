//
//  JsenPraiseTableViewCell.h
//  JsenProjectEncapsulation
//
//  Created by WangXuesen on 16/1/5.
//  Copyright © 2016年 Jsen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JsenJumpView.h"
@interface JsenPraiseTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet JsenJumpView *jumpView;
@property (weak, nonatomic) IBOutlet UIImageView *praiseImageView;
@property (weak, nonatomic) IBOutlet UILabel *praiseLabel;
@property (weak, nonatomic) IBOutlet UIImageView *priaisedImageView;
@property (weak, nonatomic) IBOutlet UILabel *priaisedLabel;


@end
