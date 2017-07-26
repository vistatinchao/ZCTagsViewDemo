//
//  TagLabel.h
//  ZCTagsViewDemo
//
//  Created by mac on 2017/7/25.
//  Copyright © 2017年 United Network Services Ltd. of Shenzhen City. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TagModel;
@interface TagLabel : UILabel

/**tag模型*/
@property (nonatomic,strong) TagModel *tagModel;

+(instancetype)tagLabel;

@end
