//
//  ViewController.m
//  KVC
//
//  Created by LeeJay on 16/6/2.
//  Copyright © 2016年 LeeJay. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController
{
    UIPageControl *_pageControl;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self createTextField];
    
    [self createScrollView];
}

- (void)createTextField
{
    // 在iOS6.0之前，可以通过KVC来设置_placeholderLabel的属性值
//    [_textField setValue:[UIColor redColor]
//              forKeyPath:@"_placeholderLabel.textColor"];
//    [_textField setValue:[UIFont systemFontOfSize:14]
//              forKeyPath:@"_placeholderLabel.font"];
    
    // iOS 6.0之后提供的attributedPlaceholder属性
        NSString *holderText = @"输入密码";
        NSMutableAttributedString *placeholder = [[NSMutableAttributedString alloc] initWithString:holderText];
        [placeholder addAttribute:NSForegroundColorAttributeName
                            value:[UIColor redColor]
                            range:NSMakeRange(0, holderText.length)];
    
        [placeholder addAttribute:NSFontAttributeName
                            value:[UIFont boldSystemFontOfSize:16]
                            range:NSMakeRange(0, holderText.length)];
        _textField.attributedPlaceholder = placeholder;
    
}

- (void)createScrollView
{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 200)];
    scrollView.delegate = self;
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.contentSize = CGSizeMake(3*self.view.bounds.size.width, 200);
    [self.view addSubview:scrollView];
    
    NSArray *colors = @[UIColor.blueColor, UIColor.blackColor,UIColor.brownColor];
    for (int i = 0; i < colors.count; i++) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(i*self.view.bounds.size.width, 0, self.view.bounds.size.width, 200)];
        view.backgroundColor = colors[i];
        [scrollView addSubview:view];
    }
    
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2-50, 180, 100, 10)];
    _pageControl.numberOfPages = colors.count;
    _pageControl.currentPage = 0;
    [self.view addSubview:_pageControl];
    
    [_pageControl setValue:[UIImage imageNamed:@"selected"]
                forKey:@"_currentPageImage"];
    [_pageControl setValue:[UIImage imageNamed:@"unselected"]
                forKey:@"_pageImage"];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int currentPage = scrollView.contentOffset.x / self.view.bounds.size.width;
    _pageControl.currentPage = currentPage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
