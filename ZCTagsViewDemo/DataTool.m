//
//  DataTool.m
//  ZCTagsViewDemo
//
//  Created by mac on 2017/7/25.
//  Copyright © 2017年 United Network Services Ltd. of Shenzhen City. All rights reserved.
//

#import "DataTool.h"
#import "TagModel.h"
@implementation DataTool
static NSArray *_tags;
+ (NSArray *)tags{
    if (_tags==nil) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"tagsData.plist" ofType:nil];
        NSArray *tagsArr = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *dataArr = [NSMutableArray array];
        for (NSDictionary *dict in tagsArr) {
            TagModel *tag = [TagModel tagWithDictionary:dict];
            [dataArr addObject:tag];
        }
        _tags = dataArr;
    }
    return _tags;
}

@end
