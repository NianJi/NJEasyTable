//
//  ViewController.m
//  NJEasyTableDemo
//
//  Created by 念纪 on 16/3/13.
//  Copyright © 2016年 cnbluebox. All rights reserved.
//

#import "ViewController.h"
#import "UITableView+NJEasyTable.h"
#import "Style1Cell.h"
#import "Style2Cell.h"
#import "Style3Cell.h"

@interface ViewController ()
{
    NSArray *_dataList;
}


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - loadData

- (void)loadData
{
    
    NJEasyTableSection *section = [[NJEasyTableSection alloc] init];
    [section addRow:({
        NJEasyTableRow *row = [[NJEasyTableRow alloc] init];
        row.model = @{@"image": @"star_blue", @"label": @"今日新闻-xxxxxxxxx"};
        row.cellHeight = 66;
        row.identifier = @"style2";
        row;
    })];
    
    [section addRow:({
        NJEasyTableRow *row = [[NJEasyTableRow alloc] init];
        row.model = @{@"title": @"商品名称", @"price": @"￥ 34.59"};
        row.cellHeight = 70;
        row.identifier = @"style1";
        row;
    })];
    
    [section addRow:({
        NJEasyTableRow *row = [[NJEasyTableRow alloc] init];
        row.model = @{@"title1": @"标题", @"title2": @"副标题"};
        row.cellHeight = 80;
        row.identifier = @"style3";
        row;
    })];
    
    
    [self.tableView.nj_TableModel addSection:section];
    [self.tableView reloadData];
}

#pragma mark - tableView datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [tableView.nj_TableModel numberOfSections];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableView.nj_TableModel numberOfRowsInSection:section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView.nj_TableModel heightForRowAtIndexPath:indexPath];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NJEasyTableRow *row = [tableView.nj_TableModel rowAtIndexPath:indexPath];
    if ([row.identifier isEqualToString:@"style1"]) {
        
        Style1Cell *cell = [tableView dequeueReusableCellWithIdentifier:row.identifier forIndexPath:indexPath];
        [cell configWithData:row.model];
        return cell;
        
    } else if ([row.identifier isEqualToString:@"style2"]) {
        Style2Cell *cell = [tableView dequeueReusableCellWithIdentifier:row.identifier forIndexPath:indexPath];
        [cell configWithData:row.model];
        return cell;
    } else if ([row.identifier isEqualToString:@"style3"]) {
        Style3Cell *cell = [tableView dequeueReusableCellWithIdentifier:row.identifier forIndexPath:indexPath];
        [cell configWithData:row.model];
        return cell;
    } else {
        return [UITableViewCell new];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

@end
