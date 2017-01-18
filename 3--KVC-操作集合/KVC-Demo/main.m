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
#import "Book.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        NSMutableArray *bookList = [NSMutableArray array];
        for (int i = 0; i <= 10; i++)  {
            Book *book = [[Book alloc] initWithName:[NSString stringWithFormat:@"book%d",i] price:i*10];
            [bookList addObject:book];
        }
        
        Student *student = [[Student alloc] initWithBookList:bookList];
        
        Teacher *teacher = [[Teacher alloc] initWithStudent:student];

        // KVC获取数组
        for (Book *book in [student valueForKey:@"bookList"]) {
            NSLog(@"bookName : %@ \t price : %f",book.name,book.price);
        }
        
        // get an array in KeyPath
        NSLog(@"All book name  : %@",[teacher valueForKeyPath:@"student.bookList.name"]);
        NSLog(@"All book name  : %@",[student valueForKeyPath:@"bookList.name"]);
        NSLog(@"All book price : %@",[student valueForKeyPath:@"bookList.price"]);
        
        // 计算（确保操作的属性为数字类型，否则运行时刻错误。)  五种集合运算符
        NSLog(@"count of book price : %@",[student valueForKeyPath:@"bookList.@count.price"]);
        NSLog(@"min of book price : %@",[student valueForKeyPath:@"bookList.@min.price"]);
        NSLog(@"avg of book price : %@",[student valueForKeyPath:@"bookList.@max.price"]);
        NSLog(@"sum of book price : %@",[student valueForKeyPath:@"bookList.@sum.price"]);
        NSLog(@"avg of book price : %@",[student valueForKeyPath:@"bookList.@avg.price"]);

    }
    return 0;
}
