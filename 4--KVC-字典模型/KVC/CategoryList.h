//
//  CategoryList.h
//  KVC-Demo
//
//  Created by LeeJay on 16/6/2.
//  Copyright © 2016年 LeeJay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CategoryList : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSString *productId;
@property (nonatomic, assign) float price;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
