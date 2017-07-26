//
//  TagCollectionViewController.m
//  ZCTagsViewDemo
//
//  Created by mac on 2017/7/25.
//  Copyright © 2017年 United Network Services Ltd. of Shenzhen City. All rights reserved.
//

#import "TagCollectionViewController.h"
#import "TagCollectionView.h"
#import "DataTool.h"
@interface TagCollectionViewController ()

@end

@implementation TagCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavBar];

    [self addTagView];
}
- (void)setNavBar{
    self.navigationItem.title = @"利用collectionView布局";
    self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    self.automaticallyAdjustsScrollViewInsets = NO;
}
- (void)addTagView{
    TagCollectionView *tagView = [[TagCollectionView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64)];
    [self.view addSubview:tagView];
    tagView.tags = [NSMutableArray arrayWithArray:[DataTool tags]];

}

@end
