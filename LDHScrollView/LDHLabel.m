//
//  LDHLabel.m
//  LDHScrollView
//
//  Created by lidonghan on 2018/4/12.
//  Copyright © 2018年 lidonghan. All rights reserved.
//

#import "LDHLabel.h"

@implementation LDHLabel

- (instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        self.textColor = [UIColor greenColor];
        self.textAlignment = NSTextAlignmentCenter;
    }
    return self;
 
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    [self.textColor set];
    CGFloat W = rect.size.width;
    CGFloat H = rect.size.height;
    UIRectFill(CGRectMake(0, H*0.5, W, 1));
}


@end
