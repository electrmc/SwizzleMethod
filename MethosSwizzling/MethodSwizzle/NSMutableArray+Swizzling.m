//
//  NSMutableArray+Swizzling.m
//  MethosSwizzling
//
//  Created by MC on 15/7/29.
//  Copyright (c) 2015年 MiaoChao. All rights reserved.
//

#import "NSMutableArray+Swizzling.h"
#import <objc/runtime.h>
#import "MethodSwizzleTool.h"

@implementation NSMutableArray (Swizzling)

// 在使用NSProxy时让该方法失效
+(void)load_useless{
    Class class = [self class];
    SEL ori_Seletor = @selector(lastObject);
    SEL swi_Seletor = @selector(hook_lastObject);
    
    instanceMethodSwizzle(class, ori_Seletor, swi_Seletor);
    classMethodSwizzle(class, @selector(array), @selector(hook_array));
    
    Method orig = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), NSSelectorFromString(@"addObject:"));
    Method override = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(addObject_override:));
    method_exchangeImplementations(orig, override);
}

+ (instancetype)hook_array{
    NSLog(@"%s",__func__);
    return [self hook_array];
}

-(id)hook_lastObject{
    NSLog(@"%s",__func__);
    id ret = [self hook_lastObject];
    return ret;
}


- (void)addObject_override:(id)anObject{
    [self addObject_override:anObject];
    NSLog(@"addObject called!");
}


// i want to hook addObject: method, but obviously, it does not work. i'm finding reason.
// 进过测试，无论是原生方法，扩展中的方法还是私有方法都是可以swizzle的，而且用__NSArrayM就可以成功swizzle
// 说明：1 用[self class]的问题；
//      2 可以用NSProxy 可以swizzle是否说明可以用NSProxy来转发一切消息
- (void)hook_addObject:(id)anObject{
    NSLog(@"%s",__func__);
    [self hook_addObject:anObject];
}

@end
