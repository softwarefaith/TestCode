//
//  MLPaymentView.m
//  TestCode
//
//  Created by 蔡杰 on 2017/5/9.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#import "MLPaymentView.h"
#import "MLPayAlertView.h"
#import "MLPayModel.h"

#import "MLPhoneVerCodeView.h"

#define KEYBOARD_HEIGHT 216


const CGFloat  KAlertHeight = 325;

@interface MLPaymentView ()

@property (nonatomic,strong) MLPayAlertView *payAlertView,*payBankCardView,*payInputCodeView;

@property (nonatomic,strong) UIButton *sureButton;

@property (nonatomic,strong) MLPhoneVerCodeView *phoneVerCodeView;

@end

@implementation MLPaymentView

#pragma mark - Setter Or Getter


#pragma mark - life
-(void)dealloc{
    
    NSLog(@"我已经销毁了");
}

-(instancetype)init{
    return [self initWithFrame:[UIScreen mainScreen].bounds];
}

-(instancetype)initWithFrame:(CGRect)frame{
 
    self = [super initWithFrame:frame];
    if (self) {
        self.animationTime = 0.5;
        [self setupViews];
        [self configBasicData];
    }
    return self;
}

#pragma mark -Override


-(void)showDefaultAction{
    
        //实现放大的弹簧效果
//        self.payAlertView.transform = CGAffineTransformMakeScale(1.21f, 1.21f);
//        self.payAlertView.alpha = 0;
//        
//        [UIView animateWithDuration:.7f delay:0.f usingSpringWithDamping:.7f initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//            
//            self.payAlertView.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
//            self.payAlertView.alpha = 1.0;
//        } completion:nil];\
    
    CGFloat payHeight = KAlertHeight;

    self.payAlertView.transform = CGAffineTransformMakeTranslation(0,payHeight);
    self.payAlertView.alpha = 0;

    
    [UIView animateWithDuration:.7f delay:0.f usingSpringWithDamping:.7f initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{

        self.payAlertView.transform = CGAffineTransformIdentity;;
        self.payAlertView.alpha = 1.0;
    } completion:nil];



}


#pragma mark -Action

- (void)addBankCard:(UITapGestureRecognizer *)sender {

    //添加卡片操作
    NSLog(@"添加卡片操作");
    
    [self performAction:paymentActionTypeAddCard param:nil];
    
}

- (void)decideToPay{ //确认还款
    
    NSLog(@"决定购买");
    
    //传递卡号
    MLPayModel *model = [self.payAlertView.dataSource lastObject];
    
    [self performAction:paymentActionTypeDecideToPay param:model];
    
    //显示验证码
    [UIView animateWithDuration:0.2 animations:^{
        self.payAlertView.alpha = 0.0;
        
    } completion:^(BOOL finished) {
       
        [self.payAlertView removeFromSuperview];
        //显示验证码输入框
        self.payInputCodeView.state = YES;
        if (!self.payInputCodeView.superview) {
            [self addSubview:self.payInputCodeView];
        }
        self.payInputCodeView.transform = CGAffineTransformMakeScale(1.21f, 1.21f);
        self.payInputCodeView.alpha = 0;
        
        [UIView animateWithDuration:.5f delay:0.f usingSpringWithDamping:.5f initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            self.payInputCodeView.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
            self.payInputCodeView.alpha = 1.0;
        } completion:^(BOOL finished) {
            
            [self.phoneVerCodeView.textField becomeFirstResponder];
        }];

    }];
    
    //发送验证码
    [self sendVerCode:nil];
}

-(void)sendVerCode:(id)sender{
    //获取验证码
    [self performAction:paymentActionTypeSendVerCode param:nil];
    [self.phoneVerCodeView.captchaBtn startCountdown];
}


#pragma mark - Override
-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    CGFloat payXpiex = 0;
    CGFloat payYpiex = [UIScreen mainScreen].bounds.size.height - KAlertHeight;
    CGFloat payWidth = self.bounds.size.width;
    CGFloat payHeight = KAlertHeight;
    CGRect paymentFrame = CGRectMake(payXpiex, payYpiex, payWidth, payHeight);

    if (self.payBankCardView.state) {
        self.payBankCardView.frame = paymentFrame;
        return;
    }
    
    if(self.payInputCodeView.state){
        
        payHeight = 270;
        payYpiex = [UIScreen mainScreen].bounds.size.height - KEYBOARD_HEIGHT-payHeight;
        paymentFrame = CGRectMake(payXpiex, payYpiex, payWidth, payHeight);
        self.payInputCodeView.frame = paymentFrame;
        return ;
    }

    self.sureButton.frame = CGRectMake((CGRectGetWidth([UIScreen mainScreen].bounds)-300)/2, payHeight-70, 300, 40);
    
    if (!self.sureButton.superview) {
        [self.payAlertView addSubview:self.sureButton];
    }
    
    self.payAlertView.frame = paymentFrame;
    
}

#pragma mark -Public
- (void)reloadPaymentViewWithAmount:(NSString *)payAmount bankCardInfo:(id)param {
    
    
    [self.payAlertView.dataSource removeAllObjects];
    [self.payInputCodeView.dataSource removeAllObjects];
    
    //金额
    MLPayModel *model = [[MLPayModel alloc] init];
    model.title = @"还款金额(元)";
    model.content = payAmount;
    
    [self.payAlertView.dataSource addObject:model];
    [self.payInputCodeView.dataSource addObject:model];
    
    //卡信息
    MLPayModel *bankmode2 = [[MLPayModel alloc] init];
    bankmode2.type = MLPayModelTypeBackCard;
    bankmode2.title = @"支付方式";
    bankmode2.content = @"交通银行(3654)";
    
    [self.payAlertView.dataSource addObject:bankmode2];
    
    
    MLPayModel *model0 = [[MLPayModel alloc] init];
    model0.type = MLPayModelTypeBackCard;
    model0.title = @"支付方式";
    model0.content = @"交通银行(3654)";
    
    MLPayModel *model1 = [[MLPayModel alloc] init];
    model1.type = MLPayModelTypeBackCard;
    model1.title = @"支付方式";
    model1.content = @"农行银行(363)";
    
    [self.payBankCardView.dataSource addObject:model0];
    [self.payBankCardView.dataSource addObject:model1];

    
    
    [self.payAlertView.infoTableView reloadData];
    
}

-(void)name{

    
}

-(void)addBankCardInfo:(id)param{
    
    
    //替换显示数据
    
    [self.payAlertView.dataSource removeLastObject];
    
    MLPayModel *bankmode2 = [[MLPayModel alloc] init];
    bankmode2.type = MLPayModelTypeBackCard;
    bankmode2.title = @"支付方式";
    bankmode2.content = @"交通银行(3697)";
    
    [self.payAlertView.dataSource addObject:bankmode2];
    [self.payBankCardView.dataSource addObject:bankmode2];
    
    [self.payAlertView.infoTableView reloadData];
    
    
}

-(void)dismiss{
    
    if (self.payInputCodeView.state == YES) {
        [self.phoneVerCodeView.textField resignFirstResponder];
        [self dismissWithCurrentView:self.payInputCodeView];
    }

}


#pragma mark -Private

-(MLPhoneVerCodeView *)phoneVerCodeView{
    
    if (_phoneVerCodeView == nil) {
        
        _phoneVerCodeView = [[MLPhoneVerCodeView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), 100)];
           _phoneVerCodeView.phoneMsgLb.text = [NSString stringWithFormat:@"%@%@",@"验证码已发送到银行预留手机",@(13521313576)];
        
    }
    
    return _phoneVerCodeView;
    
}
- (void)setupViews{
    
    self.payAlertView = [[MLPayAlertView alloc] initWithFrame:CGRectZero];
    self.payAlertView.title = @"确认还款";
    self.payAlertView.backgroundColor = [UIColor whiteColor];
    self.payAlertView.hidenBackupButton = YES;
    self.payAlertView.alertType = MLPayAlertTypePatment;
    
    [self addSubview:self.payAlertView];
    
    //确认付款按钮
    self.sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.sureButton.tag = 122;
    self.sureButton.backgroundColor = [UIColor colorWithRed:32/255 green:114/255 blue:255/255 alpha:1.000];
    self.sureButton.layer.cornerRadius = 20.0f;
    self.sureButton.layer.shadowColor = [UIColor colorWithRed:49/255 green:142/255 blue:255/255 alpha:0.4].CGColor;
    [self.sureButton setTitle:@"确认付款" forState:UIControlStateNormal];
    [self.sureButton.titleLabel setFont:[UIFont fontWithName:@"PingFangSC-Semibold" size:16.0f]];
    [self.sureButton addTarget:self action:@selector(decideToPay) forControlEvents:UIControlEventTouchUpInside];
    [self.payAlertView addSubview:self.sureButton];
    
    //银行卡界面
    self.payBankCardView = [[MLPayAlertView alloc] initWithFrame:CGRectZero];
    self.payBankCardView.title = @"选择银行卡";
    self.payBankCardView.alertType = MLPayAlertTypeBankCard;
    self.payBankCardView.hidenCloseButton = YES;
    self.payBankCardView.backgroundColor = [UIColor whiteColor];
    
    self.payBankCardView.infoTableView.tableHeaderView = [self tableViewHeaderView];
    self.payBankCardView.infoTableView.tableFooterView = [self tableviewfooterView];
    
    //输入验证码
    self.payInputCodeView = [[MLPayAlertView alloc] initWithFrame:CGRectZero];
    self.payInputCodeView.backgroundColor = [UIColor whiteColor];
    self.payInputCodeView.title = @"确认还款";
    self.payInputCodeView.hidenBackupButton = YES;
    
    self.payInputCodeView.infoTableView.tableFooterView = ({
        self.phoneVerCodeView;
    });
    
}

- (UIView *)tableViewHeaderView{
    
    CGFloat width =  CGRectGetWidth([UIScreen mainScreen].bounds);
    
    CGFloat height = 35.0f;
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    //headerView.backgroundColor = MLColor16(0xffffff);
    
    
    UIImageView *tipImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, (height - 20)/2, 20, 20)];
    tipImageView.image = [UIImage imageNamed:@"remind_red"];
    [headerView addSubview:tipImageView];
    
    UILabel *tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(32, 0, width - 32, CGRectGetHeight(headerView.bounds))];
    tipLabel.text = @"更换还款卡不影响代扣，代扣卡仍为您的收款卡";
    tipLabel.textColor = [UIColor colorWithRed:50.0/255 green:50.0/255 blue:50.0/255 alpha:1.0];
    tipLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    tipLabel.textAlignment = NSTextAlignmentLeft;
    [headerView addSubview:tipLabel];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(tipLabel.frame), width, 1)];
    lineView.backgroundColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1.0];
    [headerView addSubview:lineView];
    
    return headerView;
}

- (UIView *)tableviewfooterView {
    
       CGFloat height = 55.0f;
    CGFloat width =  CGRectGetWidth([UIScreen mainScreen].bounds);

       UIView* footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
       UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addBankCard:)];
        footerView.userInteractionEnabled = YES;
        [footerView addGestureRecognizer:tap];
        
        UIImageView *tipImageView = [[UIImageView alloc] initWithFrame:CGRectMake(21, (height - 18)/2, 24, 18)];
        tipImageView.image = [UIImage imageNamed:@"repay-bank-icon"];
        [footerView addSubview:tipImageView];
        
        UILabel *tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(53, 0, width - 53, height)];
        tipLabel.text = @"添加银行卡";
        tipLabel.textColor = [UIColor colorWithRed:50.0/255 green:50.0/255 blue:50.0/255 alpha:1.0];
        tipLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:16];;
        tipLabel.textAlignment = NSTextAlignmentLeft;
        [footerView addSubview:tipLabel];
        
        UIImage *image = [UIImage imageNamed:@"click_gray"];
        UIImageView *clickImageView = [[UIImageView alloc] initWithFrame:CGRectMake(width - 20 - image.size.width, (height - image.size.height)/2, image.size.width, image.size.height)];
        clickImageView.image = image;
        [footerView addSubview:clickImageView];
    
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(tipLabel.frame), width, 1)];
        lineView.backgroundColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1.0];
        [footerView addSubview:lineView];
    
    return footerView;
}

- (void)configBasicData{
    
    //付款页面
    __weak typeof(self) weakSelf = self;
    self.payAlertView.choosePayCardBlock = ^(MLPayModel *model) {
        
        if ([model.title isEqualToString:@"支付方式"]) {
            //跳转银行卡选择页面
        __strong typeof(weakSelf) strongSelf = weakSelf;
            
            if (!strongSelf.payBankCardView.superview) {
                [strongSelf addSubview:strongSelf.payBankCardView];
            }
            strongSelf.payBankCardView.state = YES;
            [strongSelf transformDirection:YES withCurrentView:strongSelf.payAlertView withLastView:strongSelf.payBankCardView];
        }
        
    };
    self.payAlertView.closeBlock = ^{
       __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf dismissWithCurrentView:strongSelf.payAlertView];
    };
    
    //换卡界面
    self.payBankCardView.backupBlock = ^{
       __strong typeof(weakSelf) strongSelf = weakSelf;
        strongSelf.payBankCardView.state = NO;
        
        [strongSelf transformDirection:NO withCurrentView:strongSelf.payBankCardView withLastView:strongSelf.payAlertView];
    };
    
    self.payBankCardView.choosePayCardBlock = ^(MLPayModel *model) {
        
       __strong typeof(weakSelf) strongSelf = weakSelf;
        strongSelf.payBankCardView.state = NO;
        [weakSelf transformDirection:NO withCurrentView:weakSelf.payBankCardView withLastView:weakSelf.payAlertView];
        
        [strongSelf.payAlertView.dataSource removeLastObject];
    
        [strongSelf.payAlertView.dataSource addObject:model];
        
        [strongSelf.payAlertView.infoTableView reloadData];
        
    };
    
    //验证码
    self.payInputCodeView.closeBlock = ^{
       __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf dismissWithCurrentView:strongSelf.payInputCodeView];
    };
    
    
    self.phoneVerCodeView.captchaBlock = ^(NSString *captcha) {
        __strong typeof(weakSelf) strongSelf = weakSelf;

        //TODO:获取到验证码
        [strongSelf performAction:paymentActionTypeCapchVerCode param:captcha];
    };
    
    [self.phoneVerCodeView.captchaBtn addTarget:self action:@selector(sendVerCode:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)performAction:(paymentActionType)action param:(id)param{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(paymentView:action: param:)]) {
        
        [self.delegate paymentView:self action:action param:param];
        
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
