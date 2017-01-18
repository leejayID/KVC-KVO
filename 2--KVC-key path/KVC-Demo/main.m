//
//  main.m
//  KVC-Demo
//
//  Created by LeeJay on 16/6/2.
//  Copyright © 2016年 LeeJay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Teacher.h"
#import "Student.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        Teacher *teacher = [Teacher new];
        
        // 设置 keypath value
        Student *student = [Student new];
        
        [student log];
        
        [student setValue:@"Kobe" forKey:@"name"];
        [teacher setValue:student forKey:@"student"];
        
        NSString *studentName = [teacher valueForKeyPath:@"student.name"];
        NSLog(@"Student name: %@",studentName);
        
        [teacher setValue:@"James" forKeyPath:@"student.name"];

        [student log];
        
        /*
         如果你不小心错误的使用了key而非keyPath的话，KVC会直接查找
         student.name这个属性，很明显，这个属性并不存在。所以会再调用
         UndefinedKey相关方法。而KVC对于keyPath是搜索机制第一步就是分离
         key，用小数点.来分割key，然后再像普通key一样按照先前介绍的顺序搜
         索下去。如果没有小数点，就直接向普通key来搜索。
         */

    }
    return 0;
}
