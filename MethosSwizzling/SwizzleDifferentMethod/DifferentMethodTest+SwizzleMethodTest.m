//
//  DifferentMethodTest+SwizzleMethodTest.m
//  MethosSwizzling
//
//  Created by MiaoChao on 15/11/15.
//  Copyright © 2015年 MiaoChao. All rights reserved.
//

#import "DifferentMethodTest+SwizzleMethodTest.h"
#import "MethodSwizzleTool.h"

//即使methodInExtension是一个私有方法，只要知道方法名，依旧可以swizzle成功的
@implementation DifferentMethodTest (SwizzleMethodTest)

+ (void)load{
    Class class = [self class];
    instanceMethodSwizzle(class, @selector(methodInOrigin), @selector(hook_methodInOrigin));
    instanceMethodSwizzle(class, @selector(methodInCategory), @selector(hook_methodInCategory));
    instanceMethodSwizzle(class, @selector(methodInExtension), @selector(hook_methodInExtension));
}

- (void)hook_methodInOrigin{
    NSLog(@"method in origin called in swizzle");
    [self hook_methodInOrigin];
}

- (void)hook_methodInExtension{
    NSLog(@"method in extension called in swizzle");
    [self hook_methodInExtension];
}

- (void)hook_methodInCategory{
    NSLog(@"method in category called in swizzle");
    [self hook_methodInCategory];
}


@end
