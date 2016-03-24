# NJEasyTable
A plugin of UITableView can easy manage models and auto calculate cell height with autolayout

## install

use cocoapods

    pod  'NJEasyTable'

## Usage

```
#import "UITableView+NJEasyTable.h"
```

## Set up models

You can add sections and rows to `nj_TableModel`. 

```
[self.tableView.nj_TableModel addSection:({
        NJEasyTableSection *section = [[NJEasyTableSection alloc] initWithModel:nil];
        [section addRow:({
            NJEasyTableRow *row = [[NJEasyTableRow alloc] initWithModel:model];
            row.cellHeight = 44;
            row;
        })];
        section;
})];

```

## Get models in dataSource and delegate method of UITableView

```
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [tableView.nj_TableModel numberOfSections];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableView.nj_TableModel numberOfRowsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cellIdentifier";
    TestCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[TestCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    id model = [tableView.nj_TableModel modelAtIndexPath:indexPath];
    [cell configWithModel:model];
    
    return cell;
}

```

## Dynamic cell heights

If you use autolayout in UITableViewCell. you doesn't need to calculate cell height manually.
Cell height value can like this:

```
// regist a cell for calculate cell height
TestCell *cell = [[TestCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
[self.tableView nj_registAutolayoutCell:cell forAutomaticCalculationHeightIdentifier:@"testCell"];

// implement in heightForRow
- (GFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat height = [tableView nj_intrinsicHeightAtIndexPath:indexPath
                                                forIdentifier:@"testCell"
                                              configCellBlock:^(TestCell *cell, id model) {
                                                  [cell configWithModel:model];
                                              }];
    return height;
}


```
