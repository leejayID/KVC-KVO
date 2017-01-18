//
//  Person.m
//  KVO
//
//  Created by LeeJay on 16/6/8.
//  Copyright © 2016年 LeeJay. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)setName:(NSString *)name
{
    _name = [name copy];
    
    NSLog(@"%s", __FUNCTION__);
}

- (void)willChangeValueForKey:(NSString *)key
{
    [super willChangeValueForKey:key];
    NSLog(@"%s", __FUNCTION__);

}

- (void)didChangeValueForKey:(NSString *)key
{
    [super didChangeValueForKey:key];
    NSLog(@"%s", __FUNCTION__);
}

@end
