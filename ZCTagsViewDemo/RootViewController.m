//
//  RootViewController.m
//  ZCTagsViewDemo
//
//  Created by mac on 2017/7/25.
//  Copyright © 2017年 United Network Services Ltd. of Shenzhen City. All rights reserved.
//

#import "RootViewController.h"
#import "TagCollectionViewController.h"
#import "LabViewController.h"
#import "TagEditViewController.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            TagCollectionViewController *collectionVc = [[TagCollectionViewController alloc]init];
            [self.navigationController pushViewController:collectionVc animated:YES];
        }else if (indexPath.row==1){
            LabViewController *labVc = [[LabViewController alloc]init];
            [self.navigationController pushViewController:labVc animated:YES];
        }
    }else if (indexPath.section==1){
        TagEditViewController *editVc = [[TagEditViewController alloc]init];
        [self.navigationController pushViewController:editVc animated:YES];
    }
}



@end
