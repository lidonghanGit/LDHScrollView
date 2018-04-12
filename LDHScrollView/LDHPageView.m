//
//  LDHPageView.m
//  LDHScrollView
//
//  Created by lidonghan on 2018/4/11.
//  Copyright © 2018年 lidonghan. All rights reserved.
//

#import "LDHPageView.h"
@interface LDHPageView ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic,strong) NSTimer *timer;
@end
@implementation LDHPageView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}
- (void)awakeFromNib{
    [super awakeFromNib];
    [self setup];
}

- (void)setup{
    
    //创建定时器

    [self startTimer];
    
}
- (void)nextpage{
    NSInteger page = self.pageControl.currentPage+1;
    
    if (page == self.pageControl.numberOfPages) {
        page = 0;
    }
    
    CGPoint offset = self.scrollView.contentOffset;
    
    offset.x =self.scrollView.frame.size.width *page;
    
    [self.scrollView setContentOffset:offset animated:YES];
    
}

+ (instancetype)PageVew{
    
    return [[[NSBundle mainBundle] loadNibNamed:@"LDHPageView" owner:self options:nil] lastObject];
}
#pragma mark --set方法重写
- (void)setImages:(NSArray *)images{
    _images = images;
    
    //移除之前所有数据
    
    [self.scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    for (NSInteger i = 0 ; i<images.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:images[i]];
        [self.scrollView addSubview:imageView];
    }
    
    self.pageControl.numberOfPages = images.count;
 
}
- (void)setOtherColor:(UIColor *)otherColor{
    
    _otherColor = otherColor;
    
    self.pageControl.pageIndicatorTintColor = otherColor;
    
}

- (void)setCurrentColor:(UIColor *)currentColor{
    _currentColor = currentColor;
    
    self.pageControl.currentPageIndicatorTintColor = currentColor;
    
}
- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.scrollView.frame = self.bounds;
    
    CGFloat scrollW = self.scrollView.frame.size.width;
    CGFloat scrollH = self.scrollView.frame.size.height;
    CGFloat pageW = 100;
    CGFloat pageH = 20;
    
    self.pageControl.frame = CGRectMake(scrollW - pageW, scrollH - pageH, pageW, pageH);
    
    
    
    //设置内容大小
    self.scrollView.contentSize = CGSizeMake(self.images.count*scrollW, 0);
    
    for (NSInteger i = 0; i<self.scrollView.subviews.count; i++) {
        UIImageView *imagecie = self.scrollView.subviews[i];
        imagecie.frame = CGRectMake(i*scrollW, 0, scrollW, scrollH);
    }

}
#pragma  mark -- UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    self.pageControl.currentPage = (int)(scrollView.contentOffset.x/scrollView.frame.size.width + 0.5);
    
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self stopTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self startTimer];
}
- (void)startTimer{
    self.timer =  [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(nextpage) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)stopTimer{
    [self.timer invalidate];
    self.timer = nil;
}
@end
