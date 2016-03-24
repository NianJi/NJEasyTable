//
//  Style2Cell.h
//  NJEasyTableDemo
//
//  Created by 念纪 on 16/3/13.
//  Copyright © 2016年 cnbluebox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Style2Cell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *titleImageView;
@property (weak, nonatomic) IBOutlet UILabel *label;

- (void)configWithData:(NSDictionary *)data;

@end
