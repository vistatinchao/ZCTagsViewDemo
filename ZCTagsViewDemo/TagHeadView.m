//
//  TagHeadView.m
//  ZCTagsViewDemo
//
//  Created by mac on 2017/7/25.
//  Copyright © 2017年 United Network Services Ltd. of Shenzhen City. All rights reserved.
//

#import "TagHeadView.h"
@interface TagHeadView()
/**nameLabel*/
@property (nonatomic,weak) UILabel *nameLabel;
/**detailLabel*/
@property (nonatomic,weak) UILabel *detailLabel;
/**lineView*/
@property (nonatomic,weak) UIView *lineView;
@end
@implementation TagHeadView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubView];
    }
    return self;
}

- (void)addSubView{
    UILabel *nameLabel = [[UILabel alloc]init];
    [self addSubview:nameLabel];
    nameLabel.font = [UIFont systemFontOfSize:16];
    self.nameLabel = nameLabel;

    UILabel *detailLabel = [[UILabel alloc]init];
    [self addSubview:detailLabel];
    detailLabel.font = [UIFont systemFontOfSize:12];
    detailLabel.textColor = [UIColor darkGrayColor];
    self.detailLabel = detailLabel;

    UIView *lineView = [[UIView alloc]init];
    [self addSubview:lineView];
    lineView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.4];
    self.lineView = lineView;
}

- (void)setTitle:(NSString *)title{
    _title = [title copy];
    self.nameLabel.text = title;
}

- (void)setDetail:(NSString *)detail{
    _detail = [detail copy];
    self.detailLabel.text = detail;
}

- (void)layoutSubviews{
    self.nameLabel.frame = CGRectMake(10, 0, 100, self.frame.size.height-1);
    CGFloat detailLabelX = CGRectGetMaxX(self.nameLabel.frame)+20;
    self.detailLabel.frame = CGRectMake(detailLabelX, 0, self.frame.size.width-detailLabelX, self.frame.size.height-1);
    self.lineView.frame = CGRectMake(10, CGRectGetMaxY(self.nameLabel.frame), self.frame.size.width-10, 1);
}

@end
