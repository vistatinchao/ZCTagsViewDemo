//
//  TagModel.m
//  ZCTagsViewDemo
//
//  Created by mac on 2017/7/25.
//  Copyright © 2017年 United Network Services Ltd. of Shenzhen City. All rights reserved.
//

#import "TagModel.h"
#import "UIColor+NSString.h"
@implementation TagModel

+ (instancetype)tagWithDictionary:(NSDictionary *)dict{
    TagModel *tag = [[self alloc]init];
    tag.title = dict[@"title"];
    tag.color = [UIColor colorWithString:dict[@"color"]];
    return tag;
}


@end
