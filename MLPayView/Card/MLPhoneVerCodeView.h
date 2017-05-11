//
//  MLPhoneVerCodeView.h
//  TestCode
//
//  Created by 蔡杰 on 2017/5/10.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MLCountdownButton.h"

typedef void(^ConfirmCaptchaBlock)(NSString *captcha);



@interface MLPhoneVerCodeView : UIView

@property(nonatomic, copy)   ConfirmCaptchaBlock captchaBlock;

@property(nonatomic, strong) MLCountdownButton *captchaBtn;

@property(nonatomic, strong) UITextField *textField;

@property(nonatomic, strong) UILabel *phoneMsgLb;

@end




