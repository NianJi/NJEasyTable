//
//  NJEasyTableModel.m
//  NJEasyTable
//
//  Created by 念纪 on 15/6/8.
//  Copyright (c) 2015年 cnbluebox. All rights reserved.
//

#import "NJEasyTableModel.h"
#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "NJEasyTableSection.h"
#import "NJEasyTableRow.h"
#import "NSObject+NJEasyTable.h"

const char NJEasyTableModelNumberOfRowsKey;

@interface NJEasyTableModel ()


@end

@implementation NJEasyTableModel

- (void)addSectionWithModel:(id)model {
    [self addChild:[[NJEasyTableSection alloc] initWithModel:model]];
}

- (void)addSectionWithModel:(id)model attributes:(NSDictionary *)attributes {
    [self addChild:[[NJEasyTableSection alloc] initWithModel:model attributes:attributes]];
}

- (void)addSectionsWithModels:(NSArray *)sectionModels {
    [self addSectionsWithModels:sectionModels attributeSetter:nil];
}

- (void)addSectionsWithModels:(NSArray *)sectionModels attributeSetter:(NSDictionary *(^)(id model))setterBlock {
    if (sectionModels.count) {
        for (id model in sectionModels) {
            NSDictionary *attributes = nil;
            if (setterBlock) {
                setterBlock(model);
            }
            NJEasyTableSection *section = [[NJEasyTableSection alloc] initWithModel:model attributes:attributes];
            [self addChild:section];
        }
    }
}

- (void)setSectionsWithModels:(NSArray *)sectionModels {
    [self setSectionsWithModels:sectionModels attributeSetter:nil];
}

- (void)setSectionsWithModels:(NSArray *)sectionModels attributeSetter:(NSDictionary *(^)(id model))setterBlock {
    [self removeAllChild];
    [self addSectionsWithModels:sectionModels attributeSetter:setterBlock];
}

- (void)insertSectionWithModel:(id)model atIndex:(NSInteger)index {
    [self insertSectionWithModel:model attributes:nil atIndex:index];
}

- (void)insertSectionWithModel:(id)model attributes:(NSDictionary *)attributes atIndex:(NSInteger)index {
    NJEasyTableSection *section = [[NJEasyTableSection alloc] initWithModel:model attributes:attributes];
    [self insertChild:section atIdex:index];
}

- (void)removeAllSections {
    [self removeAllChild];
}

- (void)removeSectionAtIndex:(NSInteger)index {
    [self removeChildAtIndex:index];
}

- (void)addRowWithModel:(id)model inSection:(NSInteger)section {
    [self addRowWithModel:model attributes:nil inSection:section];
}

- (void)addRowWithModel:(id)model attributes:(NSDictionary *)attributes inSection:(NSInteger)section {
    NJEasyTableSection *sectionModel = [self sectionAtIndex:section];
    if (!sectionModel) {
        sectionModel = [[NJEasyTableSection alloc] initWithModel:nil];
        [self insertChild:sectionModel atIdex:section];
    }
    NJEasyTableRow *row = [[NJEasyTableRow alloc] initWithModel:model attributes:attributes];
    [sectionModel addRow:row];
}

- (void)addRowsWithModels:(NSArray *)rowModels inSection:(NSInteger)section {
    [self addRowsWithModels:rowModels attributeSetter:nil inSection:section];
}

- (void)addRowsWithModels:(NSArray *)rowModels attributeSetter:(NSDictionary *(^)(id model))setterBlock inSection:(NSInteger)section {
    if (rowModels.count) {
        for (id model in rowModels) {
            NSDictionary *attributes = nil;
            if (setterBlock) {
                setterBlock(model);
            }
            [self addRowWithModel:model attributes:attributes inSection:section];
        }
    }
}

- (void)setRowsWithModels:(NSArray *)rowModels inSection:(NSInteger)section {
    [self setRowsWithModels:rowModels attributeSetter:nil inSection:section];
}

- (void)setRowsWithModels:(NSArray *)rowModels attributeSetter:(NSDictionary *(^)(id model))setterBlock inSection:(NSInteger)section {
    if (rowModels.count) {
        NJEasyTableSection *sectionModel = [self sectionAtIndex:section];
        [sectionModel removeAllChild];
        [self addRowsWithModels:rowModels attributeSetter:setterBlock inSection:section];
    } else {
        [self removeSectionAtIndex:section];
    }
}

- (void)insertRowWithModel:(id)model atIndex:(NSInteger)index inSection:(NSInteger)section {
    [self insertRowWithModel:model atIndex:index inSection:section];
}

- (void)insertRowWithModel:(id)model attributes:(NSDictionary *)attributes atIndex:(NSInteger)index inSection:(NSInteger)section {
    if (model) {
        NJEasyTableSection *sectionModel = [self sectionAtIndex:section];
        if (!sectionModel) {
            sectionModel = [[NJEasyTableSection alloc] initWithModel:nil];
            [self insertChild:sectionModel atIdex:section];
        }
        NJEasyTableRow *row = [[NJEasyTableRow alloc] initWithModel:model attributes:attributes];
        [sectionModel insertChild:row atIdex:section];
    }
}

- (void)removeRowAtIndexPath:(NSIndexPath *)indexPath {
    [[self rowAtIndexPath:indexPath] removeFromParent];
}

- (void)setCellHeight:(CGFloat)cellHeight atIndexPath:(NSIndexPath *)indexPath {
    NJEasyTableSection *section = [self sectionAtIndex:indexPath.section];
    [section setCellHeight:cellHeight atRow:indexPath.row];
}

- (CGFloat)cellHeightAtIndexPath:(NSIndexPath *)indexPath {
    NJEasyTableSection *section = [self sectionAtIndex:indexPath.section];
    return [section cellHeightAtRow:indexPath.row];
}

- (NJEasyTableSection *)sectionAtIndex:(NSInteger)index {
    NJEasyTableSection *section = (NJEasyTableSection *)[self childAtIndex:index];
    return section;
}

- (NJEasyTableRow *)rowAtIndexPath:(NSIndexPath *)indexPath {
    NJEasyTableSection *section = (NJEasyTableSection *)[self childAtIndex:indexPath.section];
    if (section) {
        NJEasyTableRow *row = (NJEasyTableRow *)[section childAtIndex:indexPath.row];
        return row;
    } else {
        return nil;
    }
}

- (id)modelAtIndexPath:(NSIndexPath *)indexPath {
    
    NJEasyTableSection *section = (NJEasyTableSection *)[self childAtIndex:indexPath.section];
    if (section) {
        NJEasyTableRow *row = (NJEasyTableRow *)[section childAtIndex:indexPath.row];
        if (row) {
            return row.model;
        } else {
            return section.model;
        }
    } else {
        return nil;
    }
}

- (NSInteger)sectionForModel:(id)model {
    NJNode *node = [model nj_modelObj];
    if ([node isKindOfClass:[NJEasyTableSection class]]) {
        return [(NJEasyTableSection *)node section];
    } else if ([node isKindOfClass:[NJEasyTableRow class]]) {
        return [(NJEasyTableRow *)node indexPath].section;
    } else {
        return NSNotFound;
    }
}

- (NSIndexPath *)indexPathForModel:(id)model {
    NJNode *node = [model nj_modelObj];
    if ([node isKindOfClass:[NJEasyTableRow class]]) {
        return [(NJEasyTableRow *)node indexPath];
    } else {
        return nil;
    }
}

- (NSInteger)numberOfSections {
    return self.children.count;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section {
    
    NJEasyTableSection *sectionObj = (NJEasyTableSection *)[self childAtIndex:section];
    if (sectionObj) {
        return [sectionObj numberOfRows];
    } else {
        return 0;
    }
}

@end

