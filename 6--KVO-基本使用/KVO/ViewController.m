//
//  ViewController.m
//  KVO
//
//  Created by LeeJay on 16/6/8.
//  Copyright © 2016年 LeeJay. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

static NSString *const context = @"context";

@interface ViewController ()

@property (nonatomic, strong) Person *person;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    _person = [[Person alloc] init];
    
    /**
     *  添加观察者
     *
     *  @param observer 观察者
     *  @param keyPath  被观察的属性名称
     *  @param options  观察属性的新值、旧值等的一些配置（枚举值，可以根据需要设置，例如这里可以使用两项）
     *  @param context  上下文，可以为nil。
     */
    [_person addObserver:self
              forKeyPath:@"age"
                 options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                 context:nil];
   
    /**
     *
          提供属性的新值
         NSKeyValueObservingOptionNew = 0x01,
          提供属性的旧值
         NSKeyValueObservingOptionOld = 0x02,
     
          如果指定，则在添加观察者的时候立即发送一个通知给观察者，
          并且是在注册观察者方法返回之前
         NSKeyValueObservingOptionInitial = 0x04,
     
          如果指定，则在每次修改属性时，会在修改通知被发送之前预先发送一条通知给观察者，
          这与-willChangeValueForKey:被触发的时间是相对应的。
          这样，在每次修改属性时，实际上是会发送两条通知。
         NSKeyValueObservingOptionPrior = 0x08
     *
     */
}

/**
 *  KVO回调方法
 *
 *  @param keyPath 被修改的属性
 *  @param object  被修改的属性所属对象
 *  @param change  属性改变情况（新旧值）
 *  @param context context传过来的值
 */
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSString *,id> *)change
                       context:(void *)context
{
    NSLog(@"%@对象的%@属性改变了：%@",object,keyPath,change);
 
    /*
    // 当有多个观察者的时候就要写判断
    if ([keyPath isEqualToString:@"age"] && object == _person) {
        NSLog(@"\noldnum:%@ newnum:%@",[change valueForKey:@"old"],[change valueForKey:@"new"]);
    }
    */
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    static int i = 1;
    
    // setter方法赋值 
    _person.age = i++;
    
    // KVC赋值
//    [_person setValue:@(i++) forKey:@"age"];
    
    // 成员变量赋值 不会调用监听
//    self.person->_age = i++;
//    NSLog(@"%d",self.person->_age);

}

/**
 *  移除观察者
 */
- (void)dealloc
{
    [self.person removeObserver:self forKeyPath:@"age"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
