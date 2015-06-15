//
//  NSObject+NJEasyTable.m
//  NJEasyTable
//
//  Created by 念纪 on 15/6/15.
//  Copyright (c) 2015年 cnbluebox. All rights reserved.
//

#import "NSObject+NJEasyTable.h"
#import <objc/runtime.h>

const char NJEasyTableModelOfObjectKey;

@interface NJWeakContainer : NSObject

@property (nonatomic, weak) id object;

@end

@implementation NJWeakContainer

- (instancetype)initWithObject:(id)obj {
    self = [super init];
    if (self) {
        self.object = obj;
    }
    return self;
}

@end

@implementation NSObject (NJEasyTable)

- (void)setNj_modelObj:(id)nj_modelObj {
    if (nj_modelObj) {
        objc_setAssociatedObject(self, &NJEasyTableModelOfObjectKey, [[NJWeakContainer alloc] initWithObject:nj_modelObj], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    } else {
        objc_setAssociatedObject(self, &NJEasyTableModelOfObjectKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

- (id)nj_modelObj {
    NJWeakContainer *container = objc_getAssociatedObject(self, &NJEasyTableModelOfObjectKey);
    return container.object;
}

@end
