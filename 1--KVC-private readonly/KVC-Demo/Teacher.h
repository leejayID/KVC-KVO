//
//  Teacher.h
//  KVC-Demo
//
//  Created by LeeJay on 16/6/2.
//  Copyright © 2016年 LeeJay. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  @public 可以在任何地方访问
 *  @protected 可以在当前类和其子类里访问
 *  @private 只能在当前类里访问
 */
@interface Teacher : NSObject
{
    @private
    int _age;
    BOOL _isMale;
}

@property (nonatomic, strong, getter=is) NSString *name;

/**
 *  打印
 */
- (void)log;

@end
