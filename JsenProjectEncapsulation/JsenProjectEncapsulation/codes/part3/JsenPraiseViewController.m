//
//  JsenPraiseViewController.m
//  JsenProjectEncapsulation
//
//  Created by WangXuesen on 16/1/5.
//  Copyright © 2016年 Jsen. All rights reserved.
//

#import "JsenPraiseViewController.h"
#import "JsenPraiseTableViewCell.h"
@interface JsenPraiseViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation JsenPraiseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 4;
}

- (JsenPraiseTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    JsenPraiseTableViewCell * cell = [self.tableView dequeueReusableCellWithIdentifier:@"JsenPraiseTableViewCell"];
    if (indexPath.row % 2) {
        cell.backgroundColor = [UIColor yellowColor];
    }
    return cell;
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
