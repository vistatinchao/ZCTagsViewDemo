//
//  TagCollectionView.m
//  ZCTagsViewDemo
//
//  Created by mac on 2017/7/25.
//  Copyright © 2017年 United Network Services Ltd. of Shenzhen City. All rights reserved.
//

#import "TagCollectionView.h"
#import "TagModel.h"
#import "TagLabel.h"
#import "NSString+Size.h"
#define margin 10
static NSString *const cellId = @"cell";
@interface TagCollectionView()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
/**collectionView*/
{
    NSIndexPath *_beginIndexPath;
}
@property (nonatomic,weak) UICollectionView *collectionView;
@end
@implementation TagCollectionView

#pragma mark - 初始化
+(instancetype)tagCollectionView{
    return [[self alloc]init];
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupCollectionView];
    }
    return self;
}

#pragma mark - collectionView 创建
- (void)setupCollectionView{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];//UICollectionView must be initialized with a non-nil layout parameter  UICollectonView必须传入不为空的layout参数来初始化 (不先布局会报这个错误)
    layout.minimumLineSpacing = margin;
    layout.minimumInteritemSpacing = margin;
    layout.sectionInset = UIEdgeInsetsMake(margin, margin, margin, margin);
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:layout];
    [self addSubview:collectionView];
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellId];
    collectionView.bounces = YES;
    collectionView.alwaysBounceVertical = YES;
    collectionView.dataSource = self;
    collectionView.delegate = self;
    UILongPressGestureRecognizer *gesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(iOS9_Action:)];
#warning 暂不实现
    //[collectionView addGestureRecognizer:gesture];

    self.collectionView = collectionView;
}

#pragma mark - iOS9 之后的方法
- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath
{
    // 返回YES允许row移动
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    //取出移动row数据
    TagModel *tag = self.tags[sourceIndexPath.row];
    //从数据源中移除该数据
    [self.tags removeObject:tag];
    //将数据插入到数据源中的目标位置
    [self.tags insertObject:tag atIndex:destinationIndexPath.row];
}

- (void)iOS9_Action:(UILongPressGestureRecognizer *)longPress{
    switch (longPress.state) {
        case UIGestureRecognizerStateBegan:
        { //手势开始
            //判断手势落点位置是否在row上
            NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:[longPress locationInView:self.collectionView]];
            _beginIndexPath = indexPath;
            if (indexPath == nil) {
                break;
            }
            UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:indexPath];
            [self bringSubviewToFront:cell];
            //iOS9方法 移动cell
            [self.collectionView beginInteractiveMovementForItemAtIndexPath:indexPath];
        }
            break;
        case UIGestureRecognizerStateChanged:
        { // 手势改变
            // iOS9方法 移动过程中随时更新cell位置
            [self.collectionView updateInteractiveMovementTargetPosition:[longPress locationInView:self.collectionView]];
            //[self.collectionView reloadData];
            //NSIndexPath *toIndexPath = [self.collectionView indexPathForItemAtPoint:[longPress locationInView:self.collectionView]];
            //[self.collectionView moveItemAtIndexPath:_beginIndexPath toIndexPath:toIndexPath];
        }
            break;
        case UIGestureRecognizerStateEnded:
        { // 手势结束
            // iOS9方法 移动结束后关闭cell移动
            [self.collectionView endInteractiveMovement];
            //[self.collectionView reloadData];
        }
            break;
        default: //手势其他状态
            [self.collectionView cancelInteractiveMovement];
            break;
    }
}

#pragma mark -collectionView数据源方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.tags.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    TagLabel *label = [[TagLabel alloc]init];
    [cell.contentView addSubview:label];
    label.frame = cell.contentView.bounds;
    TagModel *tag = self.tags[indexPath.row];
    label.tagModel = tag;
    return cell;
}

#pragma mark -collectionView代理方法
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    TagModel *tag = self.tags[indexPath.row];
#warning 宽度要写死拖动的时候才能布局 damn it!
  //  return CGSizeMake(80, 30);
    return CGSizeMake([tag.title sizeWithFont:[UIFont systemFontOfSize:14] maxSize:CGSizeMake(MAXFLOAT, 30)].width+margin*2, 30);
}

#pragma mark -重写传递过来的数据源
- (void)setTags:(NSMutableArray<TagModel *> *)tags{
    _tags = tags;
    // 可以不用刷新 默认colection/view第一次会刷新
    //[self.collectionView reloadData];
}



@end
