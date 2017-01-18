//
//  Person.m
//  KVO
//
//  Created by LeeJay on 16/6/8.
//  Copyright © 2016年 LeeJay. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)setAge:(int)age
{
    _age = age;
    NSLog(@"%s",__func__);
}

@end
