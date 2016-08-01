//
//  ViewController.m
//  Demo
//
//  Created by seky on 16/8/1.
//  Copyright © 2016年 seky. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
static NSString * idf =@"cell";
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>{
BOOL isOpen;
}
@property (nonatomic, strong)NSIndexPath * selectedIndex;
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initUserInterface];
}

- (void)initUserInterface{
    _tableview.delegate = self;
    _tableview.dataSource = self;
    _tableview.backgroundColor = [UIColor colorWithRed:0.8646 green:0.8646 blue:0.8646 alpha:1.0];
    [_tableview registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:idf];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == _selectedIndex.row && _selectedIndex != nil ) {
        if (isOpen == YES) {
            
            CGFloat f = 10;
            
            if (indexPath.row == 10-1){
                
                return 153.8+(f - 21);
            }
            
            return 155+(f - 21);
            
        }else{
            
            return 67;
        }
        
    }
    return 67;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell * cell =  [tableView dequeueReusableCellWithIdentifier:idf forIndexPath:indexPath];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    if (indexPath.row == _selectedIndex.row && _selectedIndex != nil) {
        //如果是展开
        if (isOpen == YES) {
            //xxxxxx
            NSLog(@"new cell");
        }else{
            //收起
            NSLog(@"old cell");
            
        }
        
        //不是自身
    } else {
    }
    
    
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
    //判断选中不同row状态时候
    //    if (self.selectedIndex != nil && indexPath.row != selectedIndex.row) {
    if (self.selectedIndex != nil && indexPath.row == _selectedIndex.row) {
        //将选中的和所有索引都加进数组中
        //        indexPaths = [NSArray arrayWithObjects:indexPath,selectedIndex, nil];
        isOpen = !isOpen;
        
    }else if (self.selectedIndex != nil && indexPath.row != _selectedIndex.row) {
        indexPaths = [NSArray arrayWithObjects:indexPath,_selectedIndex, nil];
        isOpen = YES;
        
    }
    
    //记下选中的索引
    self.selectedIndex = indexPath;
    
    //刷新
    [tableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
    
}

@end
