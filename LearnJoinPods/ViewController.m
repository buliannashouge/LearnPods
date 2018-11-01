//
//  ViewController.m
//  LearnJoinPods
//
//  Created by 王克博 on 2018/11/1.
//  Copyright © 2018年 kb. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>
#import <UIImageView+WebCache.h>
#import <MJRefresh.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    [manager POST:@"url" parameters:@{@"key":@"value"} progress:^(NSProgress * _Nonnull uploadProgress) {
        //进度
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //成功回调
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //失败回调
    }];
    
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectZero];
    [imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"imageURL"]] placeholderImage:[UIImage imageNamed:@"imagePlaceHolder"] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        //图片加载完成后，需要执行什么操作
    }];
    
    UITableView * tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    __weak typeof(self) weakSelf = self;
    tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf reloadData];
    }];
}

- (void)reloadData
{
    //下拉刷新
}

@end
