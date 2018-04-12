//
//  LDHPageView.h
//  LDHScrollView
//
//  Created by lidonghan on 2018/4/11.
//  Copyright © 2018年 lidonghan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LDHPageView : UIView
@property (nonatomic,strong) NSArray *images;

/**
 替他远点颜色
 */
@property (nonatomic,strong) UIColor *otherColor;

/**
 当前远点颜色
 */
@property (nonatomic,strong) UIColor *currentColor;

@property (nonatomic,assign) CGFloat  time;
+ (instancetype)PageVew;

@end


