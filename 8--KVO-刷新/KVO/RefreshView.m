//
//  RefreshView.m
//  KVO
//
//  Created by LeeJay on 16/6/8.
//  Copyright © 2016年 LeeJay. All rights reserved.
//

#import "RefreshView.h"

@interface RefreshView () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, assign, getter = isRefreshing) BOOL refreshing;
@property (nonatomic, assign) CGFloat offsetY;
@property (nonatomic, strong) UIActivityIndicatorView *activityView;

@end

@implementation RefreshView

+ (RefreshView *)attachObserveToScrollView:(UIScrollView *)scrollView;
{
    RefreshView *refreshView = [[RefreshView alloc] init];
    
    refreshView.scrollView = scrollView;
    
    refreshView.backgroundColor = [UIColor clearColor];
    
    refreshView.activityView = [[UIActivityIndicatorView alloc] init];
    refreshView.activityView.hidesWhenStopped = YES;
    [refreshView.activityView stopAnimating];
    [refreshView addSubview:refreshView.activityView];
    
    [refreshView.scrollView addObserver:refreshView
                             forKeyPath:@"contentOffset"
                                options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                                context:nil];
    return refreshView;
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSString *,id> *)change
                       context:(void *)context
{
    UIScrollView *scrollView = (UIScrollView *)object;
    CGFloat offsetY = scrollView.contentOffset.y;
    
    self.offsetY = offsetY;
    
    if (self.isRefreshing) {
        return;
    }
    
    if (offsetY < -60.f && offsetY >= -90.f && !self.scrollView.isDragging) {
        NSLog(@"%f",offsetY);
        
        self.refreshing = YES;
        
        [self.activityView startAnimating];
        
        if (self.UpdateDataHandler) {
            self.UpdateDataHandler();
        }
    }
    [self setNeedsDisplay];
}

- (void)endRefreshing
{
    if (self.scrollView.contentOffset.y >= 0) {
        self.refreshing = NO;
        [self.activityView stopAnimating];
    }
}

- (void)drawRect:(CGRect)rect
{
    if (self.scrollView.contentOffset.y >= 0 || self.isRefreshing) {
        return;
    }
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGFloat radius = (self.frame.size.width - 5) * 0.5;
    
    CGFloat startAngle =  - M_PI * 3 / 2;
    CGFloat endAngle =  M_PI / 30 * (-self.offsetY) - M_PI * 3 / 2;
    CGContextAddArc(context, self.frame.size.width * 0.5, self.frame.size.width * 0.5, radius, startAngle, endAngle, 0);
    
    [[UIColor whiteColor] set];
    CGContextStrokePath(context);
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    self.activityView.frame = self.bounds;
}

- (void)dealloc
{
    [self.scrollView removeObserver:self forKeyPath:@"contentOffset"];
}

@end
