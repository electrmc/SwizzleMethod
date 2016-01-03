//
//  test.h
//  TestOC
//
//  Created by MiaoChao on 15/12/26.
//  Copyright © 2015年 MiaoChao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SwizzleProxy : NSProxy

+ (id)proxyWithObject:(id)obj;

@end
