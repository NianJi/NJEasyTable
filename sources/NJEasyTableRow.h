//
//  NJEasyTableRow.h
//  NJEasyTable
//
//  Created by 念纪 on 15/6/11.
//  Copyright (c) 2015年 cnbluebox. All rights reserved.
//

#import "NJNode.h"

@interface NJEasyTableRow : NJNode

@property (nonatomic, strong) id model;
@property (nonatomic, copy)   NSString *identifier;
@property (nonatomic, assign) CGFloat cellHeight;

- (instancetype)initWithModel:(id)model;
- (instancetype)initWithModel:(id)model attributes:(NSDictionary *)attributes;

- (NSIndexPath *)indexPath;

@end
