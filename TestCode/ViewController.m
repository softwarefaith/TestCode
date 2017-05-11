//
//  ViewController.m
//  TestCode
//
//  Created by 蔡杰 on 17/3/16.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#import "ViewController.h"

#import "AppDelegate.h"

#import "UIViewController+Test.h"

#import "MLCurrencyTextField.h"

#import "MLPaymentView.h"

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,MLPaymentDelegate>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) MLCurrencyTextField *currentTextField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
//   self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
//    
//    self.tableView.dataSource = self;
//    self.tableView.delegate = self;
//    [self.tableView reloadData];
//    
//
//    [self.view addSubview:self.tableView];
//    
//    [self test];
    
//    _currentTextField = [[MLCurrencyTextField alloc] initWithFrame:CGRectMake(100, 100, 200, 90)];
//    
//    _currentTextField.borderStyle = UITextBorderStyleLine;
//    
//    _currentTextField.backgroundColor = [UIColor redColor];
//    _currentTextField.font = [UIFont systemFontOfSize:50];
//    
//    [self.view addSubview:_currentTextField];
    
    UIView *orange = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    orange.backgroundColor = [UIColor orangeColor];
   // [[UIApplication sharedApplication].keyWindow addSubview:orange];
   
}
//
-(void)test{
    
    MLPaymentView *payment = [[MLPaymentView alloc] init];
    payment.backgroundColor = [UIColor greenColor];
    payment.delegate = self;
    [payment  showInView:self.view];
    

}


#pragma mark -- Delegate

-(void)paymentView:(MLPaymentView *)paymentView action:(paymentActionType)actionType param:(id)param{
    
    switch (actionType) {
        case paymentActionTypeDecideToPay:{
            NSLog(@"pay");
            break;
        }
        case paymentActionTypeSendVerCode:{
            NSLog(@"send");

            break;}
        case paymentActionTypeCapchVerCode:{
            NSLog(@"paymentActionTypeCapchVerCode");

            break;
        }
        case paymentActionTypeAddCard:{
            
            ViewController *v = [[ViewController alloc] init];
    
            [self.navigationController pushViewController:v animated:YES];
            NSLog(@"AddCard");

            break;
        }
            
            break;
            
        default:
            break;
    }
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 100;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
  //  NSLog(@"TTTTheightForRowAtIndexPath---%ld",indexPath.row);
    return 50;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //NSLog(@"QQQestimatedHeightForRowAtIndexPath---%ld",indexPath.row);

    return 50;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"12312"];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%d",indexPath.row];
    
    return cell;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tap:(id)sender {
    
    NSLog(@"结果==%.2f",self.currentTextField.numberValue.doubleValue);
    
    
//    ViewController *v = [[ViewController alloc] init];
//    
//    [self.navigationController pushViewController:v animated:YES];
    
    MLPaymentView *payment = [[MLPaymentView alloc] init];
    payment.backgroundColor = [UIColor greenColor];
    payment.delegate = self;
    
    [payment  showInView:self.view];
    
    [payment reloadPaymentViewWithAmount:@"17.68" bankCardInfo:nil];
}



@end
