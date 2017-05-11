//
//  MLPayAlertView.m
//  TestCode
//
//  Created by 蔡杰 on 2017/5/9.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#import "MLPayAlertView.h"
#import "MLPayAlertCell.h"
#import "MLPayBankCardCell.h"
#import "MLPayModel.h"

@interface UITableViewCell ()
- (void)configWithModel:(MLPayModel *)model;

@end

@interface MLPayAlertView () <UITableViewDelegate,UITableViewDataSource>

@end

@implementation MLPayAlertView{
    
    CGFloat _innerHeight;
}

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame: frame];
    if (self) {
        [self config];
    }
    return self;
}

#pragma mark -setup

- (void)config{
    
    self.infoTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.infoTableView.delegate = self;
    self.infoTableView.dataSource = self;
    
  //  [self.infoTableView registerClass:[MLPayAlertCell class] forCellReuseIdentifier:@"PayCell"];
    
    
}

-(NSMutableArray *)dataSource{
    if (_dataSource == nil) {
        _dataSource = [[NSMutableArray alloc] init];
    }
    
    return _dataSource;
}

#pragma mark - delgate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.dataSource count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 55;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PayCell"];
   
    
    if (!cell) {
        
        Class class = self.alertType == MLPayAlertTypePatment? [MLPayAlertCell class]:[MLPayBankCardCell class];
        
        cell = [[class alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"PayCell"];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    
    if(indexPath.row < [self.dataSource count]){
           MLPayModel * payModel = self.dataSource[indexPath.row];
        
        [cell  configWithModel:payModel];
    }
    
    return cell;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row < [self.dataSource count]) {
        
        MLPayModel * payModel = self.dataSource[indexPath.row];
        
        if (self.choosePayCardBlock) {
            self.choosePayCardBlock(payModel);
        }
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
