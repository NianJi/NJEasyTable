//
//  NJEasyTableModel.h
//  NJEasyTable
//
//  Created by 念纪 on 15/6/8.
//  Copyright (c) 2015年 cnbluebox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NJNode.h"
#import "NJEasyTableSection.h"
#import "NJEasyTableRow.h"

/**
 *  attribute key of `addSectionWithModel:attributes:`method
 *  value should be `NSNumber`, which means the number of rows in TableSection
 */
extern NSString *const NJEasyTableSectionNumberOfRowsAttributeKey;

/**
 *  attribute key of `addRowWithModel:attributes:` method
 *  value should be `NSNumber`, which means the height of TableViewCell
 */
extern NSString *const NJEasyTableRowCellHeightAttributeKey;

/**
 *  the model object of table view
 */
@interface NJEasyTableModel : NJNode

- (void)addSectionWithModel:(id)model;
- (void)addSectionWithModel:(id)model attributes:(NSDictionary *)attributes;
- (void)addSectionsWithModels:(NSArray *)sectionModels;
- (void)addSectionsWithModels:(NSArray *)sectionModels attributeSetter:(NSDictionary *(^)(id model))setterBlock;
- (void)setSectionsWithModels:(NSArray *)sectionModels;
- (void)setSectionsWithModels:(NSArray *)sectionModels attributeSetter:(NSDictionary *(^)(id model))setterBlock;
- (void)insertSectionWithModel:(id)model atIndex:(NSInteger)index;
- (void)insertSectionWithModel:(id)model attributes:(NSDictionary *)attributes atIndex:(NSInteger)index;
- (void)removeAllSections;
- (void)removeSectionAtIndex:(NSInteger)index;

- (void)addRowWithModel:(id)model inSection:(NSInteger)section;
- (void)addRowWithModel:(id)model attributes:(NSDictionary *)attributes inSection:(NSInteger)section;
- (void)addRowsWithModels:(NSArray *)rowModels inSection:(NSInteger)section;
- (void)addRowsWithModels:(NSArray *)rowModels attributeSetter:(NSDictionary *(^)(id model))setterBlock inSection:(NSInteger)section;
- (void)setRowsWithModels:(NSArray *)rowModels inSection:(NSInteger)section;
- (void)setRowsWithModels:(NSArray *)rowModels attributeSetter:(NSDictionary *(^)(id model))setterBlock inSection:(NSInteger)section;
- (void)insertRowWithModel:(id)model atIndex:(NSInteger)index inSection:(NSInteger)section;
- (void)insertRowWithModel:(id)model attributes:(NSDictionary *)attributes atIndex:(NSInteger)index inSection:(NSInteger)section;
- (void)removeRowAtIndexPath:(NSIndexPath *)indexPath;

- (void)setCellHeight:(CGFloat)cellHeight atIndexPath:(NSIndexPath *)indexPath;
- (CGFloat)cellHeightAtIndexPath:(NSIndexPath *)indexPath;

- (NJEasyTableSection *)sectionAtIndex:(NSInteger)index;
- (NJEasyTableRow *)rowAtIndexPath:(NSIndexPath *)indexPath;
- (id)modelAtIndexPath:(NSIndexPath *)indexPath;

- (NSInteger)numberOfSections;
- (NSInteger)numberOfRowsInSection:(NSInteger)section;

@end


