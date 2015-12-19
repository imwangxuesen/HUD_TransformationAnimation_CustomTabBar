//
//  JsenTitleView.m
//  JsenProjectEncapsulation
//
//  Created by WangXuesen on 15/12/16.
//  Copyright © 2015年 Jsen. All rights reserved.
//

#import "JsenTitleView.h"
#import "UIImage+Expansion.h"
#import "JsenFrameKit.h"
#import "NSString+Expansion.h"
#import <SDWebImage/UIImageView+WebCache.h>
//最大的titleview rect
#define     JsenTitleView_MAX_RECT  (CGRectMake(0, 0,160,44))
//最大允许宽度
static const CGFloat    JsenTitleView_MAX_WIDTH               = 160;
//image 和 title 间距
static const CGFloat    JsenTitleView_ImageAndTitleSpace      = 5;
//只有图片时的图片最大高度
static const CGFloat    JsenTitleView_ImageWH_MAX             = 44;
//当图片和标题都有时的图片固定宽高
static const CGFloat    JsenTitleView_ImageWithTitleWH_STATIC = 30;
//当图片和标题都有时的 标题字号
static const NSInteger  JsenTitleView_WithImage_TitleFontSize = 10;
//只有标题时的 标题字号
static const NSInteger  JsenTitleView_TitleFontSize           = 14;
//标题字体颜色
static const int        JsenTitleView_TitleColor              = 0x000000;

//标题字体的名字
#define JsenTitleView_TitleFontName @"AppleGothic"
//标题字体
#define JsenTitleView_TitleFont [UIFont fontWithName:JsenTitleView_TitleFontName size:JsenTitleView_TitleFontSize]

@interface JsenTitleView()

@property (nonatomic , strong) UIImageView * imageView;
@property (nonatomic , strong) UILabel * titleLabel;

@end


@implementation JsenTitleView

#pragma mark - Public Method

+ (JsenTitleView *)imageName:(NSString *)imageName
                    imageUrl:(NSString *)imageUrlStr
                       title:(NSString *)title
                        type:(JsenTitleViewType)type{
    
    JsenTitleView * titleView = [[JsenTitleView alloc] initWithFrame:JsenTitleView_MAX_RECT];
    titleView.backgroundColor = [UIColor redColor];
    JsenTitleViewAttribute * attribute = [[JsenTitleViewAttribute alloc] init];
    attribute.imageName   = imageName;
    attribute.imageUrlStr = imageUrlStr;
    attribute.title       = title;
    attribute.titleViewType        = type;
    titleView.attribute   = attribute;
    [titleView configTitleView:attribute];
    return titleView;
    
}

#pragma mark - Private Method

- (void)configTitleView:(JsenTitleViewAttribute *)attribute {
    if (!self.attribute) {
        self.attribute = attribute;
    }
    switch (attribute.titleViewType) {
        case JsenTitleViewTypeImage:
            [self configOnlyImage];
            break;
        case JsenTitleViewTypeTitle:
            [self configOnlyTitle];
            break;
        case JsenTitleViewTypeTitleAndImage:
            [self configImageAndTitle];
            break;
            
        default:
            break;
    }
    
}

- (void)configOnlyImage {
    NSAssert(self.attribute.imageUrlStr == nil, @"只有图片的模式下不支持远程图片");
    UIImage *image = [UIImage imageNamed:self.attribute.imageName];
    CGRect imageRect = CGRectMake(0, 0, image.size.width, image.size.height);
    imageRect = [JsenFrameKit getMAXEqualScaleRectWithFatherRect:self.bounds sonRect:imageRect];
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:imageRect];
    //TODO:区分开网络还是本地分别处理
    [imageView setImage:image];
    [self addSubview:imageView];
    self.imageView = imageView;
}

- (void)configOnlyTitle {
    UILabel * label = [[UILabel alloc] initWithFrame:self.bounds];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setText:self.attribute.title];
    [label setTextColor:UIColorFromRGB(JsenTitleView_TitleColor)];
    [label setFont:[UIFont fontWithName:JsenTitleView_TitleFontName size:JsenTitleView_TitleFontSize]];
    [self addSubview:label];
    self.titleLabel = label;
    
}

- (void)configImageAndTitle {
    //拼接imge title
    CGSize titleSize = [self.attribute.title sizeWithMaxWidth:JsenTitleView_MAX_WIDTH - JsenTitleView_ImageWH_MAX - JsenTitleView_ImageAndTitleSpace font:JsenTitleView_TitleFont];
    CGFloat titleW = titleSize.width;
    CGFloat titleH = JsenTitleView_ImageWH_MAX;
    CGFloat titleY = 0;
    
    CGFloat imageW = JsenTitleView_ImageWithTitleWH_STATIC;
    CGFloat imageH = imageW;
    CGFloat imageY = (self.frame.size.height - imageH)/2.0;
    
    CGFloat imageAndTitleW = JsenTitleView_ImageAndTitleSpace + imageW + titleW;
    CGFloat imageX = (JsenTitleView_MAX_WIDTH - imageAndTitleW)/2.0;
    CGFloat titleX = imageX + imageW + JsenTitleView_ImageAndTitleSpace;
    
    CGRect imageRect = CGRectMake(imageX, imageY, imageW, imageH);
    CGRect titleRect = CGRectMake(titleX, titleY, titleW, titleH);
    
    UIImageView * imageView       = [[UIImageView alloc] initWithFrame:imageRect];
    
    if (self.attribute.imageName) {
        imageView.image = [UIImage imageNamed:self.attribute.imageName];
    } else {
        [imageView sd_setImageWithURL:[NSURL URLWithString:self.attribute.imageUrlStr] placeholderImage:[UIImage imageNamed:@"jsen_titleview_placeholder"]];
        
    }
    imageView.layer.masksToBounds = YES;
    imageView.layer.cornerRadius  = imageRect.size.width/2.0;
    [self addSubview:imageView];
    self.imageView = imageView;
    
    UILabel * titleLabel     = [[UILabel alloc] initWithFrame:titleRect];
    titleLabel.text          = self.attribute.title;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor     = UIColorFromRGB(JsenTitleView_TitleColor);
    titleLabel.font          = JsenTitleView_TitleFont;
    [self addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    
}


@end


