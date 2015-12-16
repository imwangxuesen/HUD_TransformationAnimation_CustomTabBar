//
//  JsenTitleView.h
//  JsenProjectEncapsulation
//
//  Created by WangXuesen on 15/12/16.
//  Copyright © 2015年 Jsen. All rights reserved.
//

#import "JsenBaseView.h"
#import "JsenTitleViewAttribute.h"
@interface JsenTitleView : JsenBaseView
@property (nonatomic , strong)JsenTitleViewAttribute * attribute;

+ (JsenTitleView *)imageName:(NSString *)imageName
                    imageUrl:(NSString *)imageUrlStr
                       title:(NSString *)title
                        type:(JsenTitleViewType)type;

@end


