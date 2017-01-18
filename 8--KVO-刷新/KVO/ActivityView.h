//
//  ActivityView.h
//  KVO
//
//  Created by LeeJay on 16/6/8.
//  Copyright © 2016年 LeeJay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActivityView : UIView

+ (ActivityView *)attachObserveToScrollView:(UIScrollView *)scrollView;

- (void)endRefreshing;

@property (nonatomic, copy) void (^UpdateDataHandler) (void);

@end
