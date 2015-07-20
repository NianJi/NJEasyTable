//
//  NJEasyTableSection.h
//  NJEasyTable
//
//  Created by 念纪 on 15/6/11.
//  Copyright (c) 2015年 cnbluebox. All rights reserved.
//

#import "NJNode.h"
#import "NJEasyTableRow.h"

/**
 *  section model of table view.
 */
@interface NJEasyTableSection : NJNode

@property (nonatomic, strong) id model;
@property (nonatomic, copy)   NSString *identifier;

- (instancetype)initWithModel:(id)model;
- (instancetype)initWithModel:(id)model attributes:(NSDictionary *)attributes;

- (NSInteger)numberOfRows;
- (void)setNumberOfRows:(NSInteger)numberOfRows;

- (CGFloat)cellHeightAtRow:(NSInteger)row;
- (void)setCellHeight:(CGFloat)cellHeight atRow:(NSInteger)row;

- (NSInteger)section;

- (void)addRow:(NJEasyTableRow *)row;
- (void)addRows:(NSArray *)rows;
- (void)setRows:(NSArray *)rows;
- (void)insertRow:(NJEasyTableRow *)row atIndex:(NSInteger)index;

@end
