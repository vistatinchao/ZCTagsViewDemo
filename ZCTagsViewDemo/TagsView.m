//
//  TagsView.m
//  ZCTagsViewDemo
//
//  Created by mac on 2017/7/25.
//  Copyright © 2017年 United Network Services Ltd. of Shenzhen City. All rights reserved.
//

#import "TagsView.h"
#import "TagLabel.h"
#import "TagModel.h"
#import "NSString+Size.h"

#define viewW self.frame.size.width
#define viewH self.frame.size.height

@interface TagsView()
{
    TagLabel *_lastLabel;
}
@end
@implementation TagsView

#pragma mark - 初始化
+(instancetype)tagsView{
    return [[self alloc]init];
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor blackColor];
    }
    return self;
}

#pragma mark - 重写set方法布局Label
- (void)setTags:(NSArray *)tags{
    _tags = tags;
    for (NSInteger i=0; i<tags.count; i++) {
        TagLabel *tagLabel = [[TagLabel alloc]init];
        [self addSubview:tagLabel];
        TagModel *tag = tags[i];
        tagLabel.tagModel = tag;
    }
}

#pragma mark - 布局子控件
- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat margin = 10;
    CGFloat labelX = margin;
    CGFloat labelY = margin;
    CGFloat labelW = 0;
    CGFloat labelH = 30;
    NSInteger count = self.subviews.count;
    for (int i=0; i<count; i++) {
        TagLabel *label = self.subviews[i];
        labelW = [label.text sizeWithFont:label.font maxSize:CGSizeMake(MAXFLOAT, labelH)].width+margin;
        if (_lastLabel) {//不是第一个Label
            if (CGRectGetMaxX(_lastLabel.frame)+labelW>viewW) {//换行显示
                labelX = margin;
                labelY = CGRectGetMaxY(_lastLabel.frame)+margin;
            }else{
                labelX = CGRectGetMaxX(_lastLabel.frame)+margin;
                labelY = _lastLabel.frame.origin.y;
            }
        }
        label.frame = CGRectMake(labelX, labelY, labelW, labelH);
        _lastLabel = label;// 记录上一个Label
    }
}

@end
