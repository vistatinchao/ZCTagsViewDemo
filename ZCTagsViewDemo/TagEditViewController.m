//
//  TagEditViewController.m
//  ZCTagsViewDemo
//
//  Created by mac on 2017/7/25.
//  Copyright © 2017年 United Network Services Ltd. of Shenzhen City. All rights reserved.
//

#import "TagEditViewController.h"
#import "TagEditView.h"
#import "DataTool.h"
@interface TagEditViewController ()

@end

@implementation TagEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavBar];
    [self setupTagEditView];
}

- (void)setNavBar{
    self.navigationItem.title = @"编辑tagsView";
    self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)setupTagEditView{
    TagEditView *editView = [[TagEditView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64)];
    [self.view addSubview:editView];
    editView.tags = [DataTool tags];
}

@end
