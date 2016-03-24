//
//  Style1Cell.m
//  NJEasyTableDemo
//
//  Created by 念纪 on 16/3/13.
//  Copyright © 2016年 cnbluebox. All rights reserved.
//

#import "Style1Cell.h"

@implementation Style1Cell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configWithData:(NSDictionary *)data
{
    self.label1.text = data[@"title"];
    self.label2.text = data[@"price"];
}

@end
