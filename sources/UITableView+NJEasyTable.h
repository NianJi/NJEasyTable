//
//  UITableView+NJEasyTable.h
//  NJEasyTable
//
//  Created by 念纪 on 15/6/8.
//  Copyright (c) 2015年 NianJi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NJEasyTableModel.h"

/**
 *  extension of `UITableView`.
 */
@interface UITableView (NJEasyTable)

/**
 *  then table model object of UITableView.
 *  user this object to manage models and cache datas
 */
@property (nonatomic, strong, readonly) NJEasyTableModel *nj_TableModel;

/**
 *  to calculate cell height, you need to provide a cell object for it.
 *  @param cell       cell object
 *  @param identifier the identifier of cell, not reuseIdentifier.
 */
- (void)nj_registAutolayoutCell:(UITableViewCell *)cell forAutomaticCalculationHeightIdentifier:(NSString *)identifier;

/**
 *  Get the cell height by auto caculate.
 *  @param indexPath   indexPath of cell
 *  @param identifier  the identifier regist.
 *  @param configBlock config the cell before calculation.
 *  @return
 */
- (CGFloat)nj_intrinsicHeightAtIndexPath:(NSIndexPath *)indexPath
                           forIdentifier:(NSString *)identifier
                         configCellBlock:(void(^)(id cell, id model))configBlock;

/**
 *  invalidate the cached cell height
 *  @param indexPath indexPath of cell
 */
- (void)nj_invalidateIntrinsicHeightForRowAtIndexPath:(NSIndexPath *)indexPath;

@end
