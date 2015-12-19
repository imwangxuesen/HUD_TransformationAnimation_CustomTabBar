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

/**
 *  传入参数创建一个titleview
 *
 *  @param imageName   本地图片名字
 *  @param imageUrlStr 远程图片url
 *  @param title       标题
 *  @param type        title 类型 （不支持只有图片的情况下，图片是远程的）
 *
 *  @return titleview
 */
+ (JsenTitleView *)imageName:(NSString *)imageName
                    imageUrl:(NSString *)imageUrlStr
                       title:(NSString *)title
                        type:(JsenTitleViewType)type;

@end


