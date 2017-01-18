//
//  Student.m
//  KVC-Demo
//
//  Created by LeeJay on 16/6/2.
//  Copyright © 2016年 LeeJay. All rights reserved.
//

#import "Student.h"

@implementation Student

- (instancetype)initWithBookList:(NSArray *)bookList
{
    if (self = [super init]) {
        self.bookList = bookList;
    }
    return self;
}

@end
