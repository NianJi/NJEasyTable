//
//  UITableView+NJEasyTable.m
//  NJEasyTable
//
//  Created by 念纪 on 15/6/8.
//  Copyright (c) 2015年 NianJi. All rights reserved.
//

#import "UITableView+NJEasyTable.h"
#import <objc/runtime.h>

const char NJEasyTableModelKey;
const char NJEasyTableCellKey;

@implementation UITableView (NJEasyTable)

- (NJEasyTableModel *)nj_TableModel {
    NJEasyTableModel *model = objc_getAssociatedObject(self, &NJEasyTableModelKey);
    if (!model) {
        model = [[NJEasyTableModel alloc] init];
        model.ownerTableView = self;
        objc_setAssociatedObject(self, &NJEasyTableModelKey, model, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return model;
}

- (void)nj_registAutolayoutCell:(UITableViewCell *)cell forAutomaticCalculationHeightIdentifier:(NSString *)identifier {
    
    if (!cell || !identifier) {
        return;
    }
    
    NSMutableDictionary *cellsDic = objc_getAssociatedObject(self, &NJEasyTableCellKey);
    if (!cellsDic) {
        cellsDic = [[NSMutableDictionary alloc] init];
        objc_setAssociatedObject(self, &NJEasyTableCellKey, cellsDic, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [cellsDic setObject:cell forKey:identifier];
}

- (CGFloat)nj_intrinsicHeightAtIndexPath:(NSIndexPath *)indexPath
                           forIdentifier:(NSString *)identifier
                         configCellBlock:(void(^)(id cell, id model))configBlock {
    
    id model = [self.nj_TableModel modelAtIndexPath:indexPath];
    
    CGFloat cellHeight = [self.nj_TableModel heightForRowAtIndexPath:indexPath];
    if (cellHeight > 0) {
        return cellHeight;
    }
    
    NSMutableDictionary *cellsDic = objc_getAssociatedObject(self, &NJEasyTableCellKey);
    UITableViewCell *cell = [cellsDic objectForKey:identifier];
    NSAssert(cell != nil, @"nj_registAutolayoutCell:forAutomaticCalculationHeightIdentifier: must be called");

    if (configBlock) {
        configBlock(cell, model);
    }
    
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    
    cell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(self.bounds), CGRectGetHeight(cell.bounds));
    
    // Do the layout pass on the cell, which will calculate the frames for all the views based on the constraints.
    // (Note that you must set the preferredMaxLayoutWidth on multi-line UILabels inside the -[layoutSubviews] method
    // of the UITableViewCell subclass, or do it manually at this point before the below 2 lines!)
    [cell setNeedsLayout];
    [cell layoutIfNeeded];
    
    // Get the actual height required for the cell's contentView
    CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    
    // Add an extra point to the height to account for the cell separator, which is added between the bottom
    // of the cell's contentView and the bottom of the table view cell.
    height += 1.0f;
    
    // cache the height
    [[self.nj_TableModel rowAtIndexPath:indexPath] setCellHeight:height];
    return height;
}

- (void)nj_invalidateIntrinsicHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    [[self.nj_TableModel rowAtIndexPath:indexPath] setCellHeight:0];
}

@end
