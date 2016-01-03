//
//  TestForLoad.m
//  MethosSwizzling
//
//  Created by MC on 15/7/29.
//  Copyright (c) 2015年 MiaoChao. All rights reserved.
//

#import "TestForLoad.h"

@implementation TestForLoad

+(void)load{
    NSLog(@"%s",__func__);
}

+(void)initialize{
    NSLog(@"%s",__func__);
}


- (instancetype)init{
    self = [super init];
    if (self) {
        NSLog(@"%@",[self class]);
        NSLog(@"%@",[super class]); 
    }
    return self;
}


- (void)testMethod{
    NSLog(@"%s",__func__);
}

@end
