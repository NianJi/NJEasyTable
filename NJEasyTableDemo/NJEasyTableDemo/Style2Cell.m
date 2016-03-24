//
//  Style2Cell.m
//  NJEasyTableDemo
//
//  Created by 念纪 on 16/3/13.
//  Copyright © 2016年 cnbluebox. All rights reserved.
//

#import "Style2Cell.h"

@implementation Style2Cell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configWithData:(NSDictionary *)data
{
    self.titleImageView.image = [UIImage imageNamed:data[@"image"]];
    self.label.text = data[@"label"];
}

@end
