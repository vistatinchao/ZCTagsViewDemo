//
//  TagLabel.m
//  ZCTagsViewDemo
//
//  Created by mac on 2017/7/25.
//  Copyright © 2017年 United Network Services Ltd. of Shenzhen City. All rights reserved.
//

#import "TagLabel.h"
#import "TagModel.h"
@implementation TagLabel

+ (instancetype)tagLabel{
    return [[self alloc]init];
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupLabel];
    }
    return self;
}

- (void)setTagModel:(TagModel *)tagModel{
    _tagModel = tagModel;
    self.textColor = tagModel.color;
    self.text = tagModel.title;
    self.layer.borderColor = self.textColor.CGColor;

}
- (void)setupLabel{
    self.textAlignment = NSTextAlignmentCenter;
    self.font = [UIFont systemFontOfSize:14];
    self.layer.borderWidth = 1.0f;
}
@end
