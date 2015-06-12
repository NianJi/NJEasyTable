//
//  UITableView+NJEasyTable.h
//  NJEasyTable
//
//  Created by 念纪 on 15/6/8.
//  Copyright (c) 2015年 cnbluebox. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NJEasyTableModel.h"

@interface UITableView (NJEasyTable)

@property (nonatomic, strong, readonly) NJEasyTableModel *nj_TableModel;


- (void)nj_registAutolayoutCell:(UITableViewCell *)cell forAutomaticCalculationHeightIdentifier:(NSString *)identifier;


- (CGFloat)nj_intrinsicHeightAtIndexPath:(NSIndexPath *)indexPath
                           forIdentifier:(NSString *)identifier
                         configCellBlock:(void(^)(id cell, id model))configBlock;

- (void)nj_invalidateIntrinsicHeightForRowAtIndexPath:(NSIndexPath *)indexPath;

@end
