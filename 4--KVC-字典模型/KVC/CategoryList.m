//
//  CategoryList.m
//  KVC-Demo
//
//  Created by LeeJay on 16/6/2.
//  Copyright © 2016年 LeeJay. All rights reserved.
//

#import "CategoryList.h"

@implementation CategoryList

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dictionary];
    }
    return self;
}

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"price"]) {
        self.price = [value floatValue];
    } else {
        [super setValue:value forKey:key];
    }
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        self.productId = value;
    } else {
        [super setValue:value forUndefinedKey:key];
    }
}

@end
