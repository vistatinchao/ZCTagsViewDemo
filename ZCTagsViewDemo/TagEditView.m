//
//  TagEditView.m
//  ZCTagsViewDemo
//
//  Created by mac on 2017/7/25.
//  Copyright © 2017年 United Network Services Ltd. of Shenzhen City. All rights reserved.
//

#import "TagEditView.h"
#import "TagModel.h"
#import "TagLabel.h"
#import "TagHeadView.h"
#import "NSString+Size.h"
#define margin 10
static NSString *const cellId = @"cell";
static NSString *const headerId = @"headerId";
@interface TagEditView()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
/**collectionView*/
@property (nonatomic,weak) UICollectionView *collectionView;
/**我的标签数组*/
@property (nonatomic,strong) NSMutableArray *myTags;
/**推荐标签数组*/
@property (nonatomic,strong) NSMutableArray *recommondTags;


@end
@implementation TagEditView

#pragma mark - 初始化
+(instancetype)editView{
    return [[self alloc]init];
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupCollectionView];
    }
    return self;
}

#pragma mark - collectionView初始化
- (void)setupCollectionView{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];//UICollectionView must be initialized with a non-nil layout parameter  UICollectonView必须传入不为空的layout参数来初始化 (不先布局会报这个错误)
    layout.minimumLineSpacing = margin;
    layout.minimumInteritemSpacing = margin;
    layout.sectionInset = UIEdgeInsetsMake(margin, margin, margin, margin);
    layout.headerReferenceSize = CGSizeMake(self.frame.size.width, 44);
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:layout];
    [self addSubview:collectionView];
    collectionView.backgroundColor = [UIColor whiteColor];
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellId];
    [collectionView registerClass:[TagHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerId];
    collectionView.bounces = YES;
    collectionView.alwaysBounceVertical = YES;
    collectionView.dataSource = self;
    collectionView.delegate = self;

    self.collectionView = collectionView;
}

#pragma mark - collectionView数据源方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section==0) {
        return self.myTags.count;
    }
    return self.recommondTags.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    TagLabel *label = [[TagLabel alloc]init];
    [cell.contentView addSubview:label];
    label.frame = cell.contentView.bounds;
    TagModel *tag;
    if (indexPath.section==0) {
       tag = self.myTags[indexPath.row];
    }else{
        tag = self.recommondTags[indexPath.row];
    }
    label.tagModel = tag;
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) { // 头部视图
        TagHeadView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerId forIndexPath:indexPath];
        NSString *title = @"我的标签";
        NSString *detailTitle = @"(点击我的标签可以移除)";
        if (indexPath.section==1) {
            title = @"推荐标签";
            detailTitle = @"(点击可以添加到我的标签)";
        }
        headerView.title = title;
        headerView.detail = detailTitle;
        return headerView;
    }
    return nil;
}

#pragma mark - collectionView代理方法
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    TagModel *tag;
    if (indexPath.section==0) {
        tag = self.myTags[indexPath.row];
    }else{
        tag = self.recommondTags[indexPath.row];
    }
    return CGSizeMake([tag.title sizeWithFont:[UIFont systemFontOfSize:14] maxSize:CGSizeMake(MAXFLOAT, 30)].width+margin*2, 30);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    TagModel *tag;
    if (indexPath.section==0) {
        if (self.myTags.count) {
            tag = self.myTags[indexPath.row];
            [self.myTags removeObject:tag];
            [self.recommondTags insertObject:tag atIndex:0];
            [self.collectionView moveItemAtIndexPath:indexPath toIndexPath:[NSIndexPath indexPathForItem:0 inSection:1]];//很关键的代码,会手动刷新
          //  [self.collectionView reloadData]; 有了上面这一行就没必要再刷新
        }
    }else{
        tag = self.recommondTags[indexPath.row];
        [self.recommondTags removeObject:tag];
        [self.myTags insertObject:tag atIndex:0];
        [self.collectionView moveItemAtIndexPath:indexPath toIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]];
        //[self.collectionView reloadData];

    }

}

#pragma mark - 重写传递过来的数据源
- (void)setTags:(NSArray<TagModel *> *)tags{
    _tags = tags;
    self.recommondTags = (NSMutableArray *)tags;
    // 可以不用刷新 默认colection/view第一次会刷新
    //[self.collectionView reloadData];
}

#pragma mark - lazy
- (NSMutableArray *)myTags{
    if (!_myTags) {
        _myTags = [NSMutableArray array];
    }
    return _myTags;
}

- (NSMutableArray *)recommondTags{
    if (!_recommondTags) {
        _recommondTags = [NSMutableArray array];
    }
    return _recommondTags;
}


@end
