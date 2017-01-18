//
//  Book.m
//  KVC-Demo
//
//  Created by LeeJay on 16/6/2.
//  Copyright © 2016年 LeeJay. All rights reserved.
//

#import "Book.h"

@implementation Book

- (instancetype)initWithName:(NSString *)name price:(float)price
{
    if (self = [super init]) {
        self.name = name;
        self.price = price;
    }
    return self;
}

@end
