//
//  Product.m
//  KVC-Demo
//
//  Created by LeeJay on 16/6/2.
//  Copyright © 2016年 LeeJay. All rights reserved.
//

#import "Product.h"
#import "CategoryList.h"

@implementation Product

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dictionary];
    }
    return self;
}

// 重写setValue
- (void)setValue:(id)value forKey:(NSString *)key
{
    if([key isEqualToString:@"categoryList"]) {
        self.categoryList = [NSMutableArray array];
        for (NSMutableDictionary *dict in value) {
            CategoryList *list = [[CategoryList alloc] initWithDictionary:dict];
            [self.categoryList addObject:list];
        }
    } else {
        [super setValue:value forKey:key];
    }
}

@end
