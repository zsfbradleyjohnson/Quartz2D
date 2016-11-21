//
//  ViewController.m
//  Quartz2D
//
//  Created by bradleyjohnson on 2016/11/21.
//  Copyright © 2016年 bradleyjohnson. All rights reserved.
//

#import "ViewController.h"
#import "BJView.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic , strong) UITableView * tableView;

@property (nonatomic , strong) NSDictionary * dataDic;

@end

static NSString * const CellReuseIdentifier = @"TheCell";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableDictionary * dic = [NSMutableDictionary dictionary];
    [dic setValue:@(DrawTypeLine) forKey:@"DrawTypeLine"];
    [dic setValue:@(DrawTypeBrokenLine) forKey:@"DrawTypeBrokenLine"];
    [dic setValue:@(DrawTypeRect) forKey:@"DrawTypeRect"];
    [dic setValue:@(DrawTypeRound) forKey:@"DrawTypeRound"];
    [dic setValue:@(DrawTypeCircularArc) forKey:@"DrawTypeCircularArc"];
    [dic setValue:@(DrawTypeString) forKey:@"DrawTypeString"];
    [dic setValue:@(DrawTypeImage) forKey:@"DrawTypeImage"];
    
    self.dataDic = [NSDictionary dictionaryWithDictionary:dic];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [UIView new];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellReuseIdentifier];
    
    [self.view addSubview:self.tableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataDic.allKeys.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellReuseIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = self.dataDic.allKeys[indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55.0;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController * vc = [UIViewController new];
    
    NSString * key = self.dataDic.allKeys[indexPath.row];
    id type = [self.dataDic objectForKey:key];
    
    BJView * bjView = [BJView new];
    bjView.frame = vc.view.bounds;
    bjView.type = [type integerValue];
    [vc.view addSubview:bjView];

    [self.navigationController pushViewController:vc animated:YES];
}

@end
