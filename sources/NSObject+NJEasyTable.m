//
//  NSObject+NJEasyTable.m
//  NJEasyTable
//
//  Created by 念纪 on 15/6/15.
//  Copyright (c) 2015年 NianJi. All rights reserved.
//

#import "NSObject+NJEasyTable.h"
#import <objc/runtime.h>

const char NJEasyTableNodesOfObjectKey;

@implementation NSObject (NJEasyTable)

- (void)nj_registNodeObject:(id)node {
    if (node) {
        NSHashTable *hashTable = objc_getAssociatedObject(self, &NJEasyTableNodesOfObjectKey);
        if (!hashTable) {
            hashTable = [NSHashTable weakObjectsHashTable];
            objc_setAssociatedObject(self, &NJEasyTableNodesOfObjectKey, hashTable, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
        if (![hashTable containsObject:node]) {
            [hashTable addObject:node];
        }
    }
}

- (NSArray *)nj_nodeObjects {
    NSHashTable *hashTable = objc_getAssociatedObject(self, &NJEasyTableNodesOfObjectKey);
    return hashTable.allObjects;
}

- (void)nj_unregistNodeObject:(id)node {
    if (node) {
        NSHashTable *hashTable = objc_getAssociatedObject(self, &NJEasyTableNodesOfObjectKey);
        if ([hashTable containsObject:node]) {
            [hashTable removeObject:node];
        }
    }
}

@end
