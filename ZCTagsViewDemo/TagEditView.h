//
//  TagEditView.h
//  ZCTagsViewDemo
//
//  Created by mac on 2017/7/25.
//  Copyright © 2017年 United Network Services Ltd. of Shenzhen City. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TagModel;
@interface TagEditView : UIView

/**所有的标签数组*/
@property (nonatomic,strong) NSArray<TagModel *> *tags;
/**初始化*/
+(instancetype)editView;
@end
