//
//  MLPayBankCardCell.m
//  TestCode
//
//  Created by 蔡杰 on 2017/5/9.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#import "MLPayBankCardCell.h"

const CGFloat kBankCardCap = 20;

@interface MLPayBankCardCell ()

@property (nonatomic,strong) UIImageView *line;

@property (nonatomic,strong) UIImageView *indicator;

@property (nonatomic,strong) UIImageView *icon;

@end

@implementation MLPayBankCardCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews{
    
    [self.contentView addSubview:self.line];
    [self.contentView addSubview:self.indicator];
    [self.contentView addSubview:self.icon];
    
    self.detailTextLabel.textColor = [UIColor colorWithRed:50.0/255 green:50.0/255 blue:50.0/255 alpha:1.0f];
    self.detailTextLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:18.0f];
    self.detailTextLabel.textAlignment = NSTextAlignmentLeft;
    self.detailTextLabel.baselineAdjustment = UIBaselineAdjustmentAlignCenters;

}

#pragma mark -Getter
-(UIImageView *)line{
    
    if (_line== nil) {
        _line = [[UIImageView alloc]initWithFrame:CGRectZero];
        _line.backgroundColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1.0f];
    }
    return _line;
}
-(UIImageView *)indicator{
    if (_indicator == nil) {
        _indicator = [[UIImageView alloc]initWithFrame:CGRectZero];
    }
    return _indicator;
}

-(UIImageView *)icon{
    if (_icon == nil) {
        _icon = [[UIImageView alloc]initWithFrame:CGRectZero];
    }
    return _icon;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Public
-(void)configWithModel:(MLPayModel *)model{
    self.detailTextLabel.text = model.content;
    self.icon.backgroundColor = [UIColor greenColor];
    
}

#pragma mark -
-(void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat height = CGRectGetHeight(self.contentView.frame);
    CGFloat width = CGRectGetWidth(self.contentView.frame);
    
    
    CGFloat indicatorWH = 24;
    
    if (self.indicator.superview) {
        self.indicator.frame = CGRectMake(width-kBankCardCap-indicatorWH, (height-indicatorWH)/2, indicatorWH, indicatorWH);
    }
    
    if (self.icon.superview) {
        self.icon.frame = CGRectMake(kBankCardCap,(height-26)/2, 26, 26);
        self.icon.layer.cornerRadius = 26.0/2;
        
    }
    
    CGFloat y = 0;
    CGFloat h = height;
    self.detailTextLabel.frame = CGRectMake(CGRectGetMaxX(self.icon.frame)+9, y, 150, h);
    
    self.line.frame = CGRectMake(kBankCardCap, height-1.0, width-2*kBankCardCap, 1.0);

}

@end
