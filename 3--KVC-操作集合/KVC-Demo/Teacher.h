//
//  Teacher.h
//  KVC-Demo
//
//  Created by LeeJay on 16/6/2.
//  Copyright © 2016年 LeeJay. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Student;

@interface Teacher : NSObject

@property (nonatomic, strong) Student *student ;

- (instancetype)initWithStudent:(Student *)student;

@end
