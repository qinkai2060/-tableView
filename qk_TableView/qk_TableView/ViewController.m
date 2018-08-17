//
//  ViewController.m
//  qk_TableView
//
//  Created by 秦恺 on 2018/8/17.
//  Copyright © 2018年 秦恺. All rights reserved.
//

#import "ViewController.h"
#import "QKBaseCell.h"
#import "QKBaseModel.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataArr;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
}
- (void)initData {
    NSDictionary *dicText = @{@"data":@"中国万岁",@"code":@"0"};
    NSDictionary *dicImage = @{@"data":@"3",@"code":@"1"};
    NSArray *dataArr = @[dicText,dicImage];
    for (NSDictionary *dic in dataArr) {
        QKBaseModel *model = NULL;
        Class renderClass  = [QKBaseModel getRenderClassByMessageType: [[[dic valueForKey:@"code"] description] intValue]];
        model  = [[renderClass alloc] init];
        [model getDataDict:dic];
        [self.dataArr addObject:model];
    }
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    QKBaseCell *cell = NULL;
    QKBaseModel *mode = self.dataArr[indexPath.row];
    Class renderClass = [QKBaseCell getRenderClassByMessageType:mode.cellType];
    if (!renderClass) {
        return [UITableViewCell new];
    }
    NSString* cellIndentifier = NSStringFromClass(renderClass);
    cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (!cell) {
    
        cell = [[renderClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
        cell.backgroundColor=[UIColor clearColor];
        cell.selectionStyle=NO;
    }
    cell.model = mode;
    
    [cell doMessageRendering];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    QKBaseModel *mode = self.dataArr[indexPath.row];
    return  mode.renderHeight;
}
- (NSMutableArray *)dataArr {
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
@end
