//
//  JsenFriendViewController.m
//  HearstMCB
//
//  Created by WangXuesen on 15/12/11.
//  Copyright © 2015年 hearst. All rights reserved.
//

#import "JsenFriendViewController.h"
#import "UIImage+Expansion.h"
#import "UINavigationBar+Expansion.h"

#import "JsenProgressHUD.h"

@interface JsenFriendViewController()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic , strong) NSArray * dataSource;
@property (nonatomic , strong) UITableView * tableView;
@property (nonatomic , strong) UITableViewCell * inputTextCell;

@end

@implementation JsenFriendViewController
- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    [self.navigationController.navigationBar jsen_setBackgroundColor:[UIColor purpleColor]];
    
    self.inputTextCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"inputcell"];
    
    
    _dataSource = @[
                    @"dismiss",
                    @"only spinner",
                    @"less text",
                    @"long text",
                    @"success with text",
                    @"success with out text",
                    @"error with text",
                    @"error without text"
                    ];
    
    //tableview
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height+ 0) style:UITableViewStyleGrouped];
    table.dataSource = self;
    table.delegate   = self;
    UIImageView *headerView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, IH_DEVICE_WIDTH, 264)];
    headerView.image = [UIImage imageNamed:@"img_avatar"];
    table.tableHeaderView = headerView;
    [self.view addSubview:table];
    self.tableView = table;
    [table reloadData];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar jsen_reset];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) return 2;
    if (section == 1) return [self.dataSource count];
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        if (indexPath.row == 0) {
            
            UITextField * sub = [[UITextField alloc] initWithFrame:CGRectMake(10, 0, self.view.frame.size.width - 20, self.inputTextCell.frame.size.height)];
            sub.placeholder = @"please input text";
            [sub setBackgroundColor:[UIColor yellowColor]];
            [self.inputTextCell addSubview:sub];
            return self.inputTextCell;
        }
        if (indexPath.row == 1) return [self tableView:tableView cellWithText:@"Dismiss Keyboard"];
    }
    if (indexPath.section == 1)
    {
        return [self tableView:tableView cellWithText:self.dataSource[indexPath.row]];
    }
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellWithText:(NSString *)text
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    cell.textLabel.text = text;
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0)
    {
        if (indexPath.row == 1)
        {
            [self.view endEditing:YES];
        }
    }
    if (indexPath.section == 1)
    {
        switch (indexPath.row)
        {
            case 0: [JsenProgressHUD dismiss]; break;
            case 1: [JsenProgressHUD showText:nil]; break;
            case 2: [JsenProgressHUD showText:@"Please wait..."]; break;
            case 3: [JsenProgressHUD showText:@"Please wait. We need some more time to work out this situation."]; break;
            case 4: [JsenProgressHUD showSuccess:@"That was great!"]; break;
            case 5: [JsenProgressHUD showSuccess:nil]; break;
            case 6: [JsenProgressHUD showError:@"Something went wrong."]; break;
            case 7: [JsenProgressHUD showError:nil]; break;
        }
    }
}

@end
