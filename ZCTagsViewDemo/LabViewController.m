//
//  LabViewController.m
//  ZCTagsViewDemo
//
//  Created by mac on 2017/7/25.
//  Copyright © 2017年 United Network Services Ltd. of Shenzhen City. All rights reserved.
//

#import "LabViewController.h"
#import "TagsView.h"
#import "DataTool.h"
@interface LabViewController ()

@end

@implementation LabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavBar];
    [self addLabel];
}

- (void)setNavBar{
    self.navigationItem.title = @"利用Label布局tagsView";
    self.navigationController.interactivePopGestureRecognizer.delegate = nil;
}
- (void)addLabel{
    TagsView *tagsView = [[TagsView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64)];
    [self.view addSubview:tagsView];
    tagsView.tags = [DataTool tags];
}


@end
