//
//  MethodSwizzleTool.h
//  MethosSwizzling
//
//  Created by MiaoChao on 15/11/9.
//  Copyright © 2015年 MiaoChao. All rights reserved.
//

#ifndef MethodSwizzleTool_h
#define MethodSwizzleTool_h

#include <stdio.h>
#include <objc/runtime.h>

#if defined __cplusplus
extern "C" {
#endif
    
void instanceMethodSwizzle(Class targetClass,SEL ori_Selector,SEL swi_Selector);
    
void classMethodSwizzle(Class targetClass,SEL ori_Selector,SEL swi_Selector);
    
#if defined __cplusplus
};
#endif

#endif /* MethodSwizzleTool_h */
