//
//  JsenTitleViewAttribute.h
//  JsenProjectEncapsulation
//
//  Created by WangXuesen on 15/12/16.
//  Copyright © 2015年 Jsen. All rights reserved.
//

#import <Foundation/Foundation.h>
@class JsenTitleView;

typedef enum{
    JsenTitleViewTypeTitle = 0, //只有标题
    JsenTitleViewTypeImage, //只有图片
    JsenTitleViewTypeTitleAndImage, //图片标题都有，默认图片在标题左侧，图片圆形显示
}JsenTitleViewType;

@interface JsenTitleViewAttribute : NSObject
@property (nonatomic , copy) NSString * imageName;

@property (nonatomic , copy) NSString * imageUrlStr;

@property (nonatomic , copy) NSString * title;

@property (nonatomic , assign) JsenTitleViewType titleViewType;
@end
