//
//  DifferentMethodTest.h
//  MethosSwizzling
//
//  Created by MiaoChao on 15/11/15.
//  Copyright © 2015年 MiaoChao. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DifferentMethodTestProtocol <NSObject>
@optional

- (void)methodInProtocol;

@end

@interface DifferentMethodTest : NSObject

- (void)invocationMethod;

- (void)methodInOrigin;

@end


@interface DifferentMethodTest (categoryTest)

- (void)methodInCategory;

@end