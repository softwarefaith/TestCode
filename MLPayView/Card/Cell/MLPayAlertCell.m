//
//  MLPayAlertCell.m
//  TestCode
//
//  Created by 蔡杰 on 2017/5/9.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#import "MLPayAlertCell.h"

const CGFloat kPayAlertCap = 20;

const CGFloat kPayAlertLRGap = 25;

@interface MLPayAlertCell ()

@property (nonatomic,strong) UIImageView *line;

@property (nonatomic,strong) UIImageView *indicator;

@end


@implementation MLPayAlertCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self config];
        
    }
    return self;
}


- (void)config{
    self.textLabel.textColor = [UIColor colorWithRed:100.0/255 green:100.0/255 blue:100.0/255 alpha:1.0f];
    self.textLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:16.0f];
    self.textLabel.textAlignment = NSTextAlignmentLeft;
    self.textLabel.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    
    self.detailTextLabel.textColor = [UIColor colorWithRed:50.0/255 green:50.0/255 blue:50.0/255 alpha:1.0f];
    self.detailTextLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:18.0f];
    self.detailTextLabel.textAlignment = NSTextAlignmentRight;
    self.detailTextLabel.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    
    self.imageView.backgroundColor = [UIColor redColor];
    
    [self.contentView addSubview:self.line];
}
#pragma mark -sertter or Getter

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
        UIImage *image = [UIImage imageNamed:@"click_gray"];
        _indicator.image = image;

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

- (void)showBackCardStyle{
    
    [self.contentView addSubview:self.icon];
    [self.contentView addSubview:self.indicator];
}


- (void)configWithModel:(MLPayModel *)payModel{
    
    self.textLabel.text = payModel.title;
    NSString * detailTxt = payModel.content;
    self.detailTextLabel.text = detailTxt;
    
    //TODO:
    switch (payModel.type) {
        case MLPayModelTypeBackCard:{
            //添加银行
            [self showBackCardStyle];
            self.icon.backgroundColor = [UIColor orangeColor];
        }
            break;
            
        default:
            break;
    }

}


#pragma mark - Layout

-(void)layoutSubviews{
    [super layoutSubviews];

    CGFloat height = CGRectGetHeight(self.contentView.frame);
    CGFloat width = CGRectGetWidth(self.contentView.frame);
    self.textLabel.frame = CGRectMake(kPayAlertLRGap, 0, 200, height);
    
    
    CGFloat indicatorWH = 12;
    
    if (self.indicator.superview) {
        self.indicator.frame = CGRectMake(width-kPayAlertLRGap-indicatorWH, (height-indicatorWH)/2, indicatorWH, indicatorWH);
    }
    
    CGFloat y = 0;
    CGFloat h = height;
    if ([self.detailTextLabel.text length]>0) {
        [self.detailTextLabel sizeToFit];
        y = (height-CGRectGetHeight(self.detailTextLabel.frame))/2;
        h = CGRectGetHeight(self.detailTextLabel.frame);
    }
    self.detailTextLabel.frame = CGRectMake(width-CGRectGetWidth(self.indicator.frame)-150-kPayAlertLRGap, y, 150, h);

    if (self.icon.superview) {
        self.icon.frame = CGRectMake(width-CGRectGetWidth(self.detailTextLabel.frame)-indicatorWH-kPayAlertLRGap-10,(height-25)/2, 25, 25);
        self.icon.layer.cornerRadius = 25.0/2;

    }
    

    self.line.frame = CGRectMake(kPayAlertCap, height-1.0, width-2*kPayAlertCap, 1.0);
}


@end
