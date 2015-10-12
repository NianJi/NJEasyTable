//
//  NJEasyTableModel.m
//  NJEasyTable
//
//  Created by 念纪 on 15/6/8.
//  Copyright (c) 2015年 NianJi. All rights reserved.
//

#import "NJEasyTableModel.h"
#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "NJEasyTableSection.h"
#import "NJEasyTableRow.h"
#import "NSObject+NJEasyTable.h"

@interface NJEasyTableModel ()


@end

@implementation NJEasyTableModel

- (void)addSection:(NJEasyTableSection *)section {
    [self addChild:section];
}

- (void)addSections:(NSArray *)sections {
    [self addChildFromArray:sections];
}

- (void)setSections:(NSArray *)sections {
    [self setChildren:sections];
}

- (void)insertSection:(NJEasyTableSection *)section atIndex:(NSUInteger)index {
    [self insertChild:section atIdex:index];
}

- (void)removeSectionAtIndex:(NSUInteger)index {
    [self removeChildAtIndex:index];
}

- (void)removeSectionsAtIndexSet:(NSIndexSet *)indexSet {
    [self removeChildAtIndexSet:indexSet];
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

- (id)modelAtSection:(NSInteger)section {
    NJEasyTableSection *sectionModel = (NJEasyTableSection *)[self childAtIndex:section];
    if (sectionModel) {
        return sectionModel.model;
    } else {
        return nil;
    }
}

- (NSString *)identifierAtIndexPath:(NSIndexPath *)indexPath {
    NJEasyTableSection *section = (NJEasyTableSection *)[self childAtIndex:indexPath.section];
    if (section) {
        NJEasyTableRow *row = (NJEasyTableRow *)[section childAtIndex:indexPath.row];
        if (row) {
            return row.identifier;
        } else {
            return section.identifier;
        }
    } else {
        return nil;
    }
}

- (NSInteger)sectionForModel:(id)model {
    
    NSArray *nodes = [model nj_nodeObjects];
    for (NJNode *node in nodes) {
        if ([node isKindOfClass:[NJEasyTableSection class]]) {
            if (node.parent == self) {
                return [(NJEasyTableSection *)node section];
            }
        } else if ([node isKindOfClass:[NJEasyTableRow class]]) {
            if (node.parent.parent == self) {
                return [(NJEasyTableRow *)node indexPath].section;
            }
        } else {
            return NSNotFound;
        }
    }
    return NSNotFound;
}

- (NSIndexPath *)indexPathForModel:(id)model {
    NSArray *nodes = [model nj_nodeObjects];
    for (NJNode *node in nodes) {
        if ([node isKindOfClass:[NJEasyTableRow class]]) {
            if (node.parent.parent == self) {
                return [(NJEasyTableRow *)node indexPath];
            }
        } else {
            return nil;
        }
    }
    return nil;
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

- (CGFloat)heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NJEasyTableRow *row = [self rowAtIndexPath:indexPath];
    if (row) {
        CGFloat height = row.cellHeight ?: self.ownerTableView.rowHeight;
        return height;
    }
    else {
        NJEasyTableSection *section = [self sectionAtIndex:indexPath.section];
        if (section) {
            return [section cellHeightAtRow:indexPath.row];
        }
    }
    return self.ownerTableView.rowHeight;
}

- (CGFloat)heightForHeaderAtSection:(NSUInteger)section {
    NJEasyTableSection *sectionModel = [self sectionAtIndex:section];
    CGFloat height = sectionModel.sectionHeaderHeight ?: self.ownerTableView.sectionHeaderHeight;
    return height;
}

- (CGFloat)heightForFooterAtSection:(NSUInteger)section {
    NJEasyTableSection *sectionModel = [self sectionAtIndex:section];
    CGFloat height = sectionModel.sectionFooterHeight ?: self.ownerTableView.sectionFooterHeight;
    return height;
}

- (CGFloat)preferredTotalContentHeight
{
    CGFloat height = 0;
    for (NJEasyTableSection *section in self.children) {
        
        if (section.sectionHeaderHeight > 0) {
            height += section.sectionHeaderHeight;
        }
        for (NJEasyTableRow *row in section.children) {
            height += row.cellHeight;
        }
        if (section.sectionFooterHeight > 0) {
            height += section.sectionFooterHeight;
        }
    }
    return height;
}

@end

