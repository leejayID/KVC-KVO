//
//  ViewController.m
//  KVO
//
//  Created by LeeJay on 16/6/8.
//  Copyright © 2016年 LeeJay. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@property (nonatomic, strong) Person *person;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.person = [[Person alloc] init];
    
    [self.person addObserver:self
                  forKeyPath:@"name"
                     options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                     context:nil];
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSString *,id> *)change
                       context:(void *)context
{
    NSLog(@"%@, %@", keyPath, _person.name);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    static int i = 0;
    NSString *newName = [NSString stringWithFormat:@"name->%d", i++];
  
    _person.name = newName;
}

- (void)dealloc
{
    [self.person removeObserver:self forKeyPath:@"name"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*  总结：KVO的本质就是监听对象的属性进行赋值的时候有没有调用setter方法
    1.系统会动态创建一个继承于Person的NSKVONotifying_Person
	2._person的isa指针指向的类Person变成NSKVONotifying_Person，所以接下来的_person.name = newName的时候，他调用的不是Person的setter方法，而是NSKVONotifying_Person（子类）的setter方法
	3.重写NSKVONotifying_Person的setter方法：[super setName:newName];
	4.通知观察者告诉属改变
*/
@end
