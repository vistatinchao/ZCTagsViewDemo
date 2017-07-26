//
//  UIColor+NSString.h
//  ZCTagsViewDemo
//
//  Created by mac on 2017/7/25.
//  Copyright © 2017年 United Network Services Ltd. of Shenzhen City. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (NSString)
/**
由16进制字符串转变为RGB颜色
 */
+(instancetype)colorWithString:(NSString *)hexColor;
@end
