//
//  Style1Cell.h
//  NJEasyTableDemo
//
//  Created by 念纪 on 16/3/13.
//  Copyright © 2016年 cnbluebox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Style1Cell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
- (void)configWithData:(NSDictionary *)data;

@end
