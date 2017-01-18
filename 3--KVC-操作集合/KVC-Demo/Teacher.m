//
//  Teacher.m
//  KVC-Demo
//
//  Created by LeeJay on 16/6/2.
//  Copyright © 2016年 LeeJay. All rights reserved.
//

#import "Teacher.h"

@implementation Teacher

- (instancetype)initWithStudent:(Student *)student
{
    if (self = [super init]) {
        self.student = student;
    }
    return self;
}

@end
