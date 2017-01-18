//
//  Book.h
//  KVC-Demo
//
//  Created by LeeJay on 16/6/2.
//  Copyright © 2016年 LeeJay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Book : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) float price;

- (instancetype)initWithName:(NSString *)name price:(float)price;

@end
