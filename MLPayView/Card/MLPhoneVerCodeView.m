//
//  MLPhoneVerCodeView.m
//  TestCode
//
//  Created by 蔡杰 on 2017/5/10.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#import "MLPhoneVerCodeView.h"



@interface MLPhoneVerCodeView ()<UITextFieldDelegate>
@property(nonatomic, strong) UIView *textView;
@end

@implementation MLPhoneVerCodeView

-(void)dealloc{
    
    [_captchaBtn cancelCountDown];
    NSLog(@"销毁 button");
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.phoneMsgLb];
        [self addSubview:self.textView];
        [self.textView addSubview:self.textField];
        [self.textView addSubview:self.captchaBtn];
    }
    return self;
}

- (UILabel *)phoneMsgLb {
    if (!_phoneMsgLb) {
        _phoneMsgLb = [[UILabel alloc]init];
        _phoneMsgLb.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        _phoneMsgLb.textColor = [UIColor colorWithRed:50.0/255 green:50.0/255 blue:50.0/255 alpha:1.0f];
    }
    return _phoneMsgLb;
}

- (MLCountdownButton *)captchaBtn {
    if (!_captchaBtn) {
        _captchaBtn = [MLCountdownButton buttonWithType:UIButtonTypeCustom];
        [_captchaBtn.titleLabel setTextColor:[UIColor colorWithRed:50.0/255 green:50.0/255 blue:50.0/255 alpha:1.0f]];
        [_captchaBtn setBeginningTitle:@"发送验证码" timeCount:60.0f finishedTitle:@"重新发送"];
        _captchaBtn.titleLabel.textAlignment = NSTextAlignmentRight;
         _captchaBtn.titleLabel.textColor = [UIColor whiteColor];
         _captchaBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:14.0f];
         _captchaBtn.titleLabel.backgroundColor = [UIColor clearColor];

    }
    return _captchaBtn;
}

- (UIView *)textView {
    if (!_textView) {
        _textView= [[UIView alloc]init];
        _textView.layer.cornerRadius = 4;
        _textView.layer.masksToBounds = YES;
        _textView.backgroundColor = [UIColor colorWithRed:236.0/255 green:236.0/255 blue:236.0/255 alpha:1.0f];
    }
    return _textView;
}

- (UITextField *)textField {
    if (!_textField) {
        
        _textField = [[UITextField alloc]init];
        _textField.font = [UIFont systemFontOfSize:18];
        _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _textField.keyboardType = UIKeyboardTypeNumberPad;
        NSString *placeholder = @"输入六位验证码";
        NSMutableAttributedString *attributedPlaceholder = [[NSMutableAttributedString alloc] initWithString:placeholder];
        [attributedPlaceholder addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(0, [placeholder length])];
        [attributedPlaceholder addAttribute:NSBaselineOffsetAttributeName value:@(-1.5) range:NSMakeRange(0,[placeholder length])];
        _textField.attributedPlaceholder = attributedPlaceholder;
        [_textField setValue:[UIColor colorWithRed:228.0/255 green:228.0/255 blue:228.0/255 alpha:1.0f] forKeyPath:@"_placeholderLabel.textColor"];
        _textField.delegate = self;
       
    }
    return _textField;
}


-(void)layoutSubviews{
    [super layoutSubviews];

    CGFloat width = CGRectGetWidth(self.frame);
    _phoneMsgLb.frame = CGRectMake(25, 0, width-50, 50);
     _textView.frame = CGRectMake(25, CGRectGetMaxY(_phoneMsgLb.frame), width - 50, 45);

    CGFloat lineRight = 96;
    if ([UIScreen mainScreen].bounds.size.width == 320) {
        lineRight = 92;
    }
    UIView *lineV = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetWidth(_textView.frame)-lineRight, 16, 1, CGRectGetHeight(_textView.frame) - 32)];
    lineV.backgroundColor = [UIColor colorWithRed:170.0/255 green:170.0/255 blue:170.0/255 alpha:1.0];
    [_textView addSubview:lineV];
    _textField.frame =  CGRectMake(16.5, 5,CGRectGetWidth(_textView.frame)-16.5-lineRight-5, 35);
    _captchaBtn.frame = CGRectMake(CGRectGetWidth(_textView.frame)-90, 0, 80, 45);
}

#pragma mark - Delegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if ([textField.text length] == 5 && ![string isEqualToString:@""]) {
        NSString *str = [NSString stringWithFormat:@"%@%@",textField.text,string];
        if (self.captchaBlock) {
            self.captchaBlock(str);
        }
        textField.text = str;
        return NO;
    }
    if ([textField.text length] >= 6  && ![string isEqualToString:@""]) {
        return NO;
    }
    return YES;
}


@end

