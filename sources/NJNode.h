//
//  NJNode.h
//  NJEasyTable
//
//  Created by 念纪 on 15/6/11.
//  Copyright (c) 2015年 NianJi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NJNode : NSObject

@property (nonatomic, weak) NJNode *parent;
@property (nonatomic, strong) NSArray *children;

- (void)addChild:(NJNode *)node;
- (void)addChildFromArray:(NSArray *)array;
- (void)insertChild:(NJNode *)node atIdex:(NSUInteger)index;
- (void)removeChild:(NJNode *)node;
- (void)removeChildAtIndex:(NSUInteger)index;
- (void)removeChildAtIndexSet:(NSIndexSet *)indexSet;

- (void)removeFromParent;
- (void)removeAllChild;
- (NSUInteger)nodeIndex;

- (NJNode *)firstChild;
- (NJNode *)lastChild;
- (NJNode *)childAtIndex:(NSUInteger)index;

@end
