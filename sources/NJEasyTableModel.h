//
//  NJEasyTableModel.h
//  NJEasyTable
//
//  Created by 念纪 on 15/6/8.
//  Copyright (c) 2015年 NianJi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NJNode.h"
#import "NJEasyTableSection.h"
#import "NJEasyTableRow.h"

/**
 *  the model object of table view
 */
@interface NJEasyTableModel : NJNode

@property (nonatomic, weak) UITableView *ownerTableView;

- (void)addSection:(NJEasyTableSection *)section;
- (void)addSections:(NSArray *)sections;
- (void)setSections:(NSArray *)sections;
- (void)insertSection:(NJEasyTableSection *)section atIndex:(NSUInteger)index;
- (void)removeSectionAtIndex:(NSUInteger)index;
- (void)removeSectionsAtIndexSet:(NSIndexSet *)indexSet;

- (NJEasyTableSection *)sectionAtIndex:(NSInteger)index;
- (NJEasyTableRow *)rowAtIndexPath:(NSIndexPath *)indexPath;
- (id)modelAtIndexPath:(NSIndexPath *)indexPath;
- (id)modelAtSection:(NSInteger)section;
- (NSString *)identifierAtIndexPath:(NSIndexPath *)indexPath;

- (NSInteger)sectionForModel:(id)model;
- (NSIndexPath *)indexPathForModel:(id)model;

- (NSInteger)numberOfSections;
- (NSInteger)numberOfRowsInSection:(NSInteger)section;

- (CGFloat)heightForRowAtIndexPath:(NSIndexPath *)indexPath;
- (CGFloat)heightForHeaderAtSection:(NSUInteger)section;
- (CGFloat)heightForFooterAtSection:(NSUInteger)section;

- (CGFloat)preferredTotalContentHeight;

@end


