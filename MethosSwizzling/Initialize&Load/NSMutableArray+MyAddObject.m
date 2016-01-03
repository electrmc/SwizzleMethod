//
//  NSMutableArray+MyAddObject.m
//  MethosSwizzling
//
//  Created by MC on 15/6/8.
//  Copyright (c) 2015年 MiaoChao. All rights reserved.
//

#import "NSMutableArray+MyAddObject.h"

@implementation NSMutableArray (MyAddObject)

+ (void)load
{
    NSLog(@"%s",__func__);
}

+(void)initialize{
    NSLog(@"%s",__func__);
}



@end
