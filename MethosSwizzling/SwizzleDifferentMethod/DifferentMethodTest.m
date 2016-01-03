//
//  DifferentMethodTest.m
//  MethosSwizzling
//
//  Created by MiaoChao on 15/11/15.
//  Copyright © 2015年 MiaoChao. All rights reserved.
//

#import "DifferentMethodTest.h"

@interface DifferentMethodTest ()

- (void)methodInExtension;

@end

@implementation DifferentMethodTest

- (void)methodInOrigin{
    NSLog(@"method in origin called in origin");
}

- (void)methodInExtension{
    NSLog(@"method in extension called in origin");
}

- (void)invocationMethod{
    [self methodInOrigin];
    [self methodInExtension];
}

@end


@implementation DifferentMethodTest (categoryTest)

- (void)methodInCategory{
    NSLog(@"method in category called in origin");
}

@end

















