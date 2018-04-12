//
//  ViewController.m
//  LDHScrollView
//
//  Created by lidonghan on 2018/4/9.
//  Copyright © 2018年 lidonghan. All rights reserved.
//

#import "ViewController.h"
#import "LDHPageView.h"
#import "LDHLabel.h"
@interface ViewController ()<UIScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    LDHLabel *label  = [[LDHLabel alloc] init];
//    label.text =@"asdfhashf";
//    label.frame = CGRectMake(10, 100, 100, 50);
//    [self.view addSubview:label];
    LDHPageView *pageView = [LDHPageView PageVew];
    pageView.images = @[@"img_00",@"img_01",@"img_02",@"img_03",@"img_04"];

    pageView.frame = CGRectMake(37, 50, 300, 300);

    pageView.otherColor = [UIColor orangeColor];

    pageView.currentColor = [UIColor greenColor];

    [self.view addSubview:pageView];


}
#pragma UIScrollViewDeletage



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
