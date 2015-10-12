//
//  NJNode.m
//  NJEasyTable
//
//  Created by 念纪 on 15/6/11.
//  Copyright (c) 2015年 NianJi. All rights reserved.
//

#import "NJNode.h"

@interface NJNode ()
{
    NSMutableArray *_children;
    __weak NJNode         *_parent;
}

@end

@implementation NJNode

- (void)setChildren:(NSArray *)children {
    if ([children isKindOfClass:[NSArray class]]) {
        @synchronized(self) {
            _children = [[NSMutableArray alloc] initWithCapacity:[children count]];
            for (NJNode *node in children) {
                node.parent = self;
                [_children addObject:node];
            }
        }
    } else {
        @synchronized(self) {
            _children = nil;
        }
    }
}

- (NSArray *)children {
    return _children.copy;
}

- (void)addChild:(NJNode *)node {
    if (node) {
        node.parent = self;
        @synchronized(self) {
            if (!_children) {
                _children = [[NSMutableArray alloc] init];
            }
            [_children addObject:node];
        }
    }
}

- (void)setParent:(NJNode *)parent {
    
    if (_parent != parent) {
        _parent = parent;
    }
}

- (NJNode *)parent {
    
    if (![_parent.children containsObject:self]) {
        _parent = nil;
    }
    return _parent;
}

- (void)addChildFromArray:(NSArray *)array {
    if ([array count]) {
        for (NJNode *node in array) {
            NSAssert([node isKindOfClass:[NJNode class]], @"addChild must be NJNode object");
            [self addChild:node];
        }
    }
}

- (void)insertChild:(NJNode *)node atIdex:(NSUInteger)index {
    if (node && index <= _children.count) {
        node.parent = self;
        @synchronized(self) {
            if (!_children) {
                _children = [[NSMutableArray alloc] init];
            }
            [_children insertObject:node atIndex:index];
        }
    }
}

- (void)removeChild:(NJNode *)node {
    @synchronized(self) {
        if ([_children containsObject:node]) {
            [_children removeObject:node];
        }
    }
}

- (void)removeChildAtIndex:(NSUInteger)index {
    @synchronized(self) {
        if (_children.count > index) {
            [_children removeObjectAtIndex:index];
        }
    }
}

- (void)removeChildAtIndexSet:(NSIndexSet *)indexSet {
    @synchronized(self) {
        [indexSet enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop) {
            if (_children.count > idx) {
                [_children removeObjectAtIndex:idx];
            }
        }];
    }
}

- (void)removeFromParent {
    [self.parent removeChild:self];
}

- (void)removeAllChild {
    @synchronized(self) {
        _children = nil;
    }
}

- (NSUInteger)nodeIndex {
    if (self.parent) {
        return [self.parent.children indexOfObject:self];
    }
    return NSNotFound;
}

- (NSObject *)firstChild {
    return [self.children firstObject];
}

- (NSObject *)lastChild {
    return [self.children lastObject];
}

- (NSObject *)childAtIndex:(NSUInteger)index {
    NSArray *children = self.children;
    if (children.count > index) {
        return [children objectAtIndex:index];
    } else {
        return nil;
    }
}

@end
