//
//  NJEasyTableSection.m
//  NJEasyTable
//
//  Created by 念纪 on 15/6/11.
//  Copyright (c) 2015年 NianJi. All rights reserved.
//

#import "NJEasyTableSection.h"
#import "NSObject+NJEasyTable.h"

@interface NJEasyTableSection ()
{
    NSInteger   _numberOfRows;
    NSMutableDictionary *_rowHeightDic;
}

@end

@implementation NJEasyTableSection

- (void)setModel:(id)model {
    if (_model != model) {
        _model = model;
        [_model nj_registNodeObject:self];
    }
}

+ (instancetype)sectionWithModel:(id)model
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

- (NSInteger)numberOfRows {
    
    NSUInteger count = self.children.count;
    if (count > 0) {
        return count;
    } else if (_numberOfRows > 0) {
        return _numberOfRows;
    } else {
        return 1;
    }
}

- (void)setNumberOfRows:(NSInteger)numberOfRows {
    _numberOfRows = numberOfRows;
}

- (CGFloat)cellHeightAtRow:(NSInteger)row {
    
    NJEasyTableRow *rowObj = (NJEasyTableRow *)[self childAtIndex:row];
    if (rowObj) {
        return rowObj.cellHeight;
    } else {
        NSNumber *rowHeight = [_rowHeightDic objectForKey:@(row)];
        if (rowHeight) {
            return rowHeight.floatValue;
        } else {
            return 0;
        }
    }
}

- (void)setCellHeight:(CGFloat)cellHeight atRow:(NSInteger)row {
    NJEasyTableRow *rowObj = (NJEasyTableRow *)[self childAtIndex:row];
    if (rowObj) {
        rowObj.cellHeight = cellHeight;
    } else {
        if (!_rowHeightDic) {
            _rowHeightDic = [[NSMutableDictionary alloc] init];
        }
        [_rowHeightDic setObject:@(cellHeight) forKey:@(row)];
    }
}

- (NSInteger)section {
    return [self nodeIndex];
}

- (void)addRow:(NJEasyTableRow *)row {
    [self addChild:row];
}

- (void)addRows:(NSArray *)rows {
    [self addChildFromArray:rows];
}

- (void)setRows:(NSArray *)rows {
    [self setChildren:rows];
}

- (void)insertRow:(NJEasyTableRow *)row atIndex:(NSInteger)index {
    [self insertChild:row atIdex:index];
}

- (void)removeRowAtIndex:(NSUInteger)index {
    [self removeChildAtIndex:index];
}

- (void)removeRowsForIdentifier:(NSString *)identifier {
    [self.children enumerateObjectsUsingBlock:^(NJEasyTableRow *row, NSUInteger idx, BOOL *stop) {
        if ([row.identifier isEqualToString:identifier]) {
            [row removeFromParent];
        }
    }];
}

@end
