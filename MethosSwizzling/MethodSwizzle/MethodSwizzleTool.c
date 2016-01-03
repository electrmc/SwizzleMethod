//
//  MethodSwizzleTool.c
//  MethosSwizzling
//
//  Created by MiaoChao on 15/11/9.
//  Copyright © 2015年 MiaoChao. All rights reserved.
//

#include "MethodSwizzleTool.h"

void instanceMethodSwizzle(Class targetClass,SEL ori_Selector,SEL swi_Selector){
    
    Method ori_Mehtod = nil, swi_Method = nil;
    ori_Mehtod = class_getInstanceMethod(targetClass, ori_Selector);
    swi_Method = class_getInstanceMethod(targetClass, swi_Selector);
    if (ori_Mehtod!=nil && swi_Method!=nil) {
        // 方式1
//        method_exchangeImplementations(ori_Mehtod, swi_Method);
        
        // 方式2
        IMP ori_Imp = method_getImplementation(ori_Mehtod);
        IMP swi_Imp = method_setImplementation(swi_Method, ori_Imp);
        method_setImplementation(ori_Mehtod, swi_Imp);
    }
}

void classMethodSwizzle(Class targetClass,SEL ori_Selector,SEL swi_Selector){
    Method ori_Mehtod = nil, swi_Method = nil;
    ori_Mehtod = class_getClassMethod(targetClass, ori_Selector);
    swi_Method = class_getClassMethod(targetClass, swi_Selector);
    if (ori_Mehtod!=nil && swi_Method!=nil) {
        // 方式1
//        method_exchangeImplementations(ori_Mehtod, swi_Method);
        
        // 方式2
        IMP ori_Imp = method_getImplementation(ori_Mehtod);
        IMP swi_Imp = method_setImplementation(swi_Method, ori_Imp);
        method_setImplementation(ori_Mehtod, swi_Imp);
    }
}
