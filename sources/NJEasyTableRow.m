//
//  NJEasyTableRow.m
//  NJEasyTable
//
//  Created by 念纪 on 15/6/11.
//  Copyright (c) 2015年 NianJi. All rights reserved.
//

#import "NJEasyTableRow.h"
#import "NSObject+NJEasyTable.h"

@implementation NJEasyTableRow

- (void)setModel:(id)model {
    if (_model != model) {
        _model = model;
        [_model nj_registNodeObject:self];
    }
}

+ (instancetype)rowWithModel:(id)model
{
    return [[self alloc] initWithModel:model];
}

- (instancetype)initWithModel:(id)model {
    self = [super init];
    if (self) {
        self.model = model;
    }
    return self;
}

- (NSIndexPath *)indexPath {
    
    NSUInteger section = [self.parent nodeIndex];
    NSUInteger row = [self nodeIndex];
    
    if (section != NSNotFound && row != NSNotFound) {
        
        return [NSIndexPath indexPathForRow:row inSection:section];
    } else {
        
        return nil;
    }
}

@end
