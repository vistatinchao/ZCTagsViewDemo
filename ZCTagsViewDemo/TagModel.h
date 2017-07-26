//
//  TagModel.h
//  ZCTagsViewDemo
//
//  Created by mac on 2017/7/25.
//  Copyright © 2017年 United Network Services Ltd. of Shenzhen City. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TagModel : NSObject

/**title*/
@property (nonatomic,copy) NSString *title;
/**color*/
@property (nonatomic,copy) UIColor *color;

/**
 字典转模型
 */
+(instancetype)tagWithDictionary:(NSDictionary *)dict;

@end
