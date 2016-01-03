//
//  main.m
//  MethosSwizzling
//
//  Created by MC on 15/6/8.
//  Copyright (c) 2015年 MiaoChao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TestForLoad.h"
#import "SubTestForLoad.h"
#import "MessageCounter.h"
#import "DifferentMethodTest.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /*
         * self 和 super的讨论
         */
        TestForLoad *test1 = [[TestForLoad alloc]init];
        test1 = nil;
        
        /*
         * swizzle : extension method; category method; protocol method;
         */
        DifferentMethodTest *testMethod = [[DifferentMethodTest alloc]init];
        [testMethod invocationMethod];
        [testMethod methodInCategory];
        
        /*
         * 下面的是判断load和initial方法的执行时机和顺序
         * load 会在程序已启动就执行;
         * initial 会在该类的第一个方法执行前执行，而且子类父类都会调用，即，每个类都会调用该方法，应该是创建类对象
         * load 方法父类会早于子类执行
         */
        TestForLoad *test = [TestForLoad alloc];
        SubTestForLoad *subTest = [SubTestForLoad alloc];
        subTest = nil;//消除警告
        
        /*
         * 通过NSProxy进行消息转发
         */
        UMKMessageCountingProxy *messageCounter = [[UMKMessageCountingProxy alloc]initWithObject:test];
        [messageCounter performSelector:@selector(testMethod) withObject:nil];
        NSLog(@"message counter: %lu",(unsigned long)[messageCounter receivedMessageCountForSelector:@selector(testMethod)]);
        
        /*
         * swizzle addObject:
         * 1,通过__NSArrayM来判断类对象的
         * 2,通过NSProxySwizzle来swizzlemethod
         * 注意这两个方法不能同时用，因为都是基于load方法进行swizzle的
         */
        NSMutableArray *ary = [NSMutableArray array];
        [ary addObject:@"123"];
        [ary addObject:@"456"];
        [ary addObject:@"135"];
        NSString *str = [ary lastObject];
        NSLog(@"%@",str);

        
        
    }
    return 0;
}
