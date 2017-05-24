//
//  MLAdjustAmountView.m
//  TestCode
//
//  Created by 蔡杰 on 2017/5/22.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#import "MLAdjustAmountView.h"
#import "MLAutoChangeLabel.h"

@interface MLAdjustAmountView ()

@property (nonatomic,strong) UIImageView        *backGroudView;

@property (nonatomic,strong) UIButton           *closeButton;

@property (nonatomic,strong) UIImageView        *lineImageView;

@property (nonatomic,strong) UIImageView        *topImageView;

@property (nonatomic,strong) UILabel            *titleLabel;

@property (nonatomic,strong) UILabel            *subTitleLabel;

@property (nonatomic,strong) MLAutoChangeLabel  *amountLabel;

@property (nonatomic,strong) UILabel            *tipsLabel;

@property (nonatomic,strong) UIButton           *sureButton;

@end

@implementation MLAdjustAmountView

#pragma mark - Life

- (void)dealloc {
    NSLog(@"MLAdjustAmountView我消失了");
}



#pragma mark - UI

- (void)setupSubViews {
    [self addSubview:self.backGroudView];
    _backGroudView.userInteractionEnabled = YES;
    [self addSubview:self.closeButton];
    [self addSubview:self.lineImageView];
    [self.backGroudView addSubview:self.topImageView];
    [self.backGroudView addSubview:self.titleLabel];
    [self.backGroudView addSubview:self.subTitleLabel];
    [self.backGroudView addSubview:self.amountLabel];
    [self.backGroudView addSubview:self.tipsLabel];
    [self.backGroudView addSubview:self.sureButton];
    
    self.backGroudView.clipsToBounds = YES;
    self.backGroudView.layer.cornerRadius = 10.0f;
    
}

#pragma mark - Layout

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat width  = 260.0f;
    CGFloat height = 320.0f;
    
    _backGroudView.frame = CGRectMake((CGRectGetWidth(self.frame)-width)/2, (CGRectGetHeight(self.frame)-height)/2, width, height);
    
    _topImageView.frame = CGRectMake(0, 0, width, 80);
    
    _lineImageView.frame = CGRectMake(CGRectGetMaxX(_backGroudView.frame)-13-2, CGRectGetMinY(_backGroudView.frame)-30, 2, 30);
    
    CGFloat closeButtonWH = 26.0f;
    _closeButton.frame = CGRectMake(CGRectGetMaxX(_backGroudView.frame)-closeButtonWH, CGRectGetMinY(_lineImageView.frame)-closeButtonWH, closeButtonWH, closeButtonWH);
    
    _titleLabel.frame = CGRectMake(0, 28, width, 38);
    _subTitleLabel.frame = CGRectMake(0, CGRectGetMaxY(_titleLabel.frame), width, 25);
    
    _amountLabel.frame = CGRectMake(0, CGRectGetMaxY(_subTitleLabel.frame)+25, width, 85);
    _tipsLabel.frame =  CGRectMake(0, CGRectGetMaxY(_amountLabel.frame)+10, width, 18);
    
    _sureButton.frame = CGRectMake((width-210)/2, height-20-44, 210, 44);
    _sureButton.layer.cornerRadius = 44 / 2;
}

#pragma mark - Action

- (void)closeAction:(id)sender {

    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        
        if (self.closeCallBack) {
            self.closeCallBack();
            self.closeCallBack = NULL;
        }
        [self removeFromSuperview];
    }];
    
}

- (void)lookupMyAmount:(id)sender {
    
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        
        if (self.lookupAmountCallBack) {
            self.lookupAmountCallBack();
            self.lookupAmountCallBack = NULL;
        }
        [self removeFromSuperview];
    }];

}

#pragma mark - Public

- (void)showInView:(UIView *)superView {
    
    [super showInView:superView];
    

    [self.amountLabel changeFromNumber:0 toNumber:self.toNumber duration:0.5 animationOptions:MLCounterAnimationOptionCurveLinear attributedFormat:^NSAttributedString *(CGFloat currentNumber){
        
        NSString *numberString = [NSString stringWithFormat:@"%.0f",currentNumber];
        NSString *ori = [NSString stringWithFormat:@"+%@元",numberString];
        
        NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:ori];
        
        [attri addAttributes:@{NSFontAttributeName:[MLPublic createBoldRegulePingFangFontWithSize:40.0f],NSBaselineOffsetAttributeName:@(12)} range:NSMakeRange(0, 1)];
        
        if ([numberString length] > 0) {
            NSShadow *shadow = [[NSShadow alloc] init];
            shadow.shadowBlurRadius = 7.0f;
            shadow.shadowOffset = CGSizeMake(0, 4);
            shadow.shadowColor = [MLColor16(0xFF5A17) colorWithAlphaComponent:0.5];
            [attri addAttributes:@{NSShadowAttributeName:shadow,NSFontAttributeName:[MLPublic createCustomFontWithFontName:@"STHeitiTC-Medium" Size:85.0f]} range:NSMakeRange(1, [numberString length])];
        }
        [attri addAttributes:@{NSFontAttributeName:[MLPublic createBoldRegulePingFangFontWithSize:14.0f],NSBaselineOffsetAttributeName:@(0)} range:NSMakeRange([ori length]-1, 1)];

        return attri;
        
    } completion:^(CGFloat endNumber) {
        
        
        
    }];
 
    
}

#pragma private


#pragma mark - Setter && Getter

- (UIImageView *)backGroudView {
    if (nil == _backGroudView) {
        _backGroudView = [[UIImageView alloc] init];
        _backGroudView.backgroundColor = MLColor16(0xFFFFFF);
    }
    
    return _backGroudView;
}

- (UIButton *)closeButton {
    if (nil == _closeButton) {
        _closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_closeButton addTarget:self action:@selector(closeAction:) forControlEvents:UIControlEventTouchUpInside];
        [_closeButton setImage:[UIImage imageNamed:@"button_close"] forState:UIControlStateNormal];
    }
    return _closeButton;
}

- (UIImageView *)lineImageView {
    if (nil == _lineImageView) {
        _lineImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _lineImageView.backgroundColor = MLColor16(0xFFFFFF);
    }
    return _lineImageView;
}

- (UIImageView *)topImageView {
    if (nil == _topImageView) {
        _topImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _topImageView.image = [UIImage imageNamed:@"lookupamount_top"];
    }
    return _topImageView;
}



- (UILabel *)titleLabel {
    if (nil == _titleLabel){
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLabel.font = [MLPublic createBoldRegulePingFangFontWithSize:30.0f];
        _titleLabel.textColor = MLColor16(0xFB5A20);
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.text = @"恭喜你";
    }
    return _titleLabel;
}


- (UILabel *)subTitleLabel {
    if (nil == _subTitleLabel){
        _subTitleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _subTitleLabel.font = [MLPublic createBoldRegulePingFangFontWithSize:20.0f];
        _subTitleLabel.textColor = MLColor16(0xFB5A20);
        _subTitleLabel.textAlignment = NSTextAlignmentCenter;
        _subTitleLabel.text = @"取现额度提升";
    }
    return _subTitleLabel;
}

- (MLAutoChangeLabel *)amountLabel {
    if (nil == _amountLabel){
        _amountLabel = [[MLAutoChangeLabel alloc] initWithFrame:CGRectZero];
        _amountLabel.font = [MLPublic createBoldRegulePingFangFontWithSize:85.0f];
        _amountLabel.textColor = MLColor16(0xFB5A20);
        _amountLabel.textAlignment = NSTextAlignmentCenter;
        _amountLabel.adjustsFontSizeToFitWidth = YES;
        //_amountLabel.font = [MLPublic createCustomFontWithFontName:@"STHeitiTC-Medium" Size:85.0f];
        //_amountLabel.text = @"1000";
    }
    return _amountLabel;
}

- (UILabel *)tipsLabel {
    if (nil == _tipsLabel){
        _tipsLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _tipsLabel.font = [MLPublic createRegularPingFangFontWithSize:12.0f];
        _tipsLabel.textColor = MLColor16(0x646464);
        _tipsLabel.textAlignment = NSTextAlignmentCenter;
        _tipsLabel.text = @"这个福利，只给按时还款的宝宝";
    }
    return _tipsLabel;
}

- (UIButton *)sureButton {
    if (nil == _sureButton) {
        _sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sureButton addTarget:self action:@selector(lookupMyAmount:) forControlEvents:UIControlEventTouchUpInside];
        [_sureButton setBackgroundColor:[UIColor redColor]];
        [_sureButton setTitleColor:MLColor16(0xFFFFFF) forState:UIControlStateNormal];
        _sureButton.titleLabel.font = [MLPublic createBoldRegulePingFangFontWithSize:16.0f];
        [_sureButton setBackgroundColor:MLColor16(0x2072FF)];
        [_sureButton setTitle:@"查看我的额度" forState:UIControlStateNormal];
    }
    return _sureButton;
    
}


@end
