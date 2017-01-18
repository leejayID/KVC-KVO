//
//  ViewController.m
//  KVC
//
//  Created by LeeJay on 16/6/2.
//  Copyright © 2016年 LeeJay. All rights reserved.
//

#import "ViewController.h"
#import "Product.h"
#import "CategoryList.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"product" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"%@",dict);
    NSDictionary *dataDict = dict[@"product"];
    Product *p = [[Product alloc] initWithDictionary:dataDict];
    NSLog(@"%@ == %@",p.name,p.categoryList);
    
    for (CategoryList *list in p.categoryList) {
        NSLog(@"%@ == %@ == %@ == %.2f", list.name, list.image, list.productId, list.price);
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
