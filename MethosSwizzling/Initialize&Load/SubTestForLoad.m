//
//  SubTestForLoad.m
//  MethosSwizzling
//
//  Created by MC on 15/8/19.
//  Copyright (c) 2015年 MiaoChao. All rights reserved.
//

#import "SubTestForLoad.h"

@implementation SubTestForLoad
+(void)load{
    NSLog(@"%s",__func__);
}

+(void)initialize{
    NSLog(@"%s",__func__);
}
@end
