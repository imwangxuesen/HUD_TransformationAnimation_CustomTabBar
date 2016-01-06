//
//  JsenPraiseTableViewCell.m
//  JsenProjectEncapsulation
//
//  Created by WangXuesen on 16/1/5.
//  Copyright © 2016年 Jsen. All rights reserved.
//

#import "JsenPraiseTableViewCell.h"
#import "JsenJumpView.h"
@implementation JsenPraiseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.jumpView layoutIfNeeded];
        self.jumpView.markedImage = [UIImage imageNamed:@"praised"];
        self.jumpView.non_markedImage = [UIImage imageNamed:@"praise"];
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [self.jumpView addGestureRecognizer:tap];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
        [self.jumpView layoutIfNeeded];
        self.jumpView.markedImage = [UIImage imageNamed:@"praised"];
        self.jumpView.non_markedImage = [UIImage imageNamed:@"praise"];
    self.jumpView.state = JsenJumpViewStateDown;
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [self.jumpView addGestureRecognizer:tap];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)tap:(UITapGestureRecognizer *)tap {
    NSLog(@"aaaaa");
    [self.jumpView animate];
}
@end
