//
//  ActivityView.m
//  KVO
//
//  Created by LeeJay on 16/6/8.
//  Copyright © 2016年 LeeJay. All rights reserved.
//

#import "ActivityView.h"

@interface ActivityView () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, assign, getter = isRefreshing) BOOL refreshing;
@property (nonatomic, assign) CGFloat offsetY;
@property (nonatomic, strong) UIActivityIndicatorView *activityView;
@property (nonatomic, strong) UIImageView *rotationimageView;

@end

@implementation ActivityView

+ (ActivityView *)attachObserveToScrollView:(UIScrollView *)scrollView
{
    ActivityView *refreshView = [[ActivityView alloc] init];
    
    refreshView.scrollView = scrollView;
    refreshView.backgroundColor = [UIColor clearColor];
    
    refreshView.activityView = [[UIActivityIndicatorView alloc] init];
    refreshView.activityView.hidesWhenStopped = YES;
    [refreshView.activityView stopAnimating];
    [refreshView addSubview:refreshView.activityView];
    
    [refreshView addSubview:refreshView.rotationimageView];
    
    [refreshView.scrollView addObserver:refreshView
                             forKeyPath:@"contentOffset"
                                options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                                context:nil];
    return refreshView;
}

- (UIImageView *)rotationimageView
{
    if (!_rotationimageView) {
        _rotationimageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
        _rotationimageView.image = [UIImage imageNamed:@"moreBtn_Nav"];
    }
    return _rotationimageView;
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
        
        self.refreshing = YES;
        self.rotationimageView.hidden = YES;
        [self.activityView startAnimating];
        
        if (self.UpdateDataHandler) {
            self.UpdateDataHandler();
        }
    }

    [self rotationView];
}

- (void)rotationView
{
    if (self.scrollView.contentOffset.y >= 0 || self.isRefreshing) {
        [self setDefaultImageState];
        return;
    }
    
    self.rotationimageView.image = [UIImage imageNamed:@"caching"];
    CGFloat endAngle = M_PI / 30 * self.offsetY;
    self.rotationimageView.transform = CGAffineTransformMakeRotation(endAngle);
}

- (void)endRefreshing
{
    if (self.scrollView.contentOffset.y >= 0) {
        self.refreshing = NO;
        self.rotationimageView.hidden = NO;
        [self setDefaultImageState];
        [self.activityView stopAnimating];
    }
}

- (void)setDefaultImageState
{
    self.rotationimageView.transform = CGAffineTransformMakeRotation(0);
    self.rotationimageView.image = [UIImage imageNamed:@"moreBtn_Nav"];
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
