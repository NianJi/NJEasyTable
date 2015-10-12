//
//  NSObject+NJEasyTable.h
//  NJEasyTable
//
//  Created by 念纪 on 15/6/15.
//  Copyright (c) 2015年 NianJi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (NJEasyTable)

- (void)nj_registNodeObject:(id)node;
- (NSArray *)nj_nodeObjects;
- (void)nj_unregistNodeObject:(id)node;

@end
