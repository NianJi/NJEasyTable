//
//  SecondViewController.m
//  NJEasyTable
//
//  Created by 念纪 on 15/6/8.
//  Copyright (c) 2015年 cnbluebox. All rights reserved.
//

#import "SecondViewController.h"
#import "UITableView+NJEasyTable.h"

@interface Test2Cell : UITableViewCell

@property (nonatomic, strong) UILabel *sizeLabel;

@end

@implementation Test2Cell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        [self.contentView addSubview:self.sizeLabel];
        
        [self.sizeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self.contentView.mas_leading).offset(18);
            make.top.equalTo(self.contentView.mas_top).offset(9);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-9).priority(998);
            make.trailing.equalTo(self.contentView.mas_trailing).offset(-18).priority(998);
        }];
        
        [self.sizeLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
        self.sizeLabel.preferredMaxLayoutWidth = [[UIScreen mainScreen] bounds].size.width - 36;
    }
    return self;
}

- (UILabel *)sizeLabel {
    if (!_sizeLabel) {
        _sizeLabel = [[UILabel alloc] init];
        _sizeLabel.numberOfLines = 0;
    }
    return _sizeLabel;
}

@end

@interface SecondViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [self.tableView.nj_TableModel addRowsWithModels:@[
                                                      @"aa",
                                                      @"aaaaaaaaaaaaaaaaaaaaaaaa",
                                                      @"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                                                      @"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                                                      @"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                                                      ]
                                          inSection:0];
    
    [self.tableView.nj_TableModel addRowsWithModels:@[
                                                      @"aa",
                                                      @"aaaaaaaaaaaaaaaaaaaaaaaa",
                                                      @"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                                                      @"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                                                      @"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                                                      ]
                                          inSection:1];
    
    [self.tableView.nj_TableModel addRowsWithModels:@[
                                                      @"aa",
                                                      @"aaaaaaaaaaaaaaaaaaaaaaaa",
                                                      @"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                                                      @"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                                                      @"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                                                      ]
                                          inSection:2];
    
    [self.tableView.nj_TableModel addRowsWithModels:@[
                                                      @"aa",
                                                      @"aaaaaaaaaaaaaaaaaaaaaaaa",
                                                      @"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                                                      @"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                                                      @"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                                                      ]
                                          inSection:3];
    
    [self.tableView.nj_TableModel addRowsWithModels:@[
                                                      @"aa",
                                                      @"aaaaaaaaaaaaaaaaaaaaaaaa",
                                                      @"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                                                      @"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                                                      @"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                                                      ]
                                          inSection:4];
    
    
    [self.tableView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - views

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.backgroundView = nil;
        
        Test2Cell *cell = [[Test2Cell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        [_tableView nj_registAutolayoutCell:cell forAutomaticCalculationHeightIdentifier:@"cell"];
    }
    return _tableView;
}

#pragma mark - table view

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [tableView.nj_TableModel numberOfSections];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableView.nj_TableModel numberOfRowsInSection:section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat height = [tableView nj_intrinsicHeightAtIndexPath:indexPath
                                                forIdentifier:@"cell"
                                              configCellBlock:^(Test2Cell *cell, NSString *text) {
                                                  
                                                  cell.sizeLabel.text = text;
                                              }];
    return height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cellIdentifier";
    Test2Cell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[Test2Cell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    NSString *text = [tableView.nj_TableModel modelAtIndexPath:indexPath];
    cell.sizeLabel.text = text;
    [cell setNeedsLayout];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return @"哈哈";
}

@end
