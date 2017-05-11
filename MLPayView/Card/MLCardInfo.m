//
//  MLCardInfo.m
//  TestCode
//
//  Created by 蔡杰 on 2017/5/9.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#import "MLCardInfo.h"

const CGFloat kCardTitleHeight = 58;

@interface MLCardInfo ()

@property (nonatomic,strong) UIButton *backupButton,*closeButton;

@property (nonatomic,strong) UIImageView *line;

@property (nonatomic,strong) UILabel *titleLabel;




@end

@implementation MLCardInfo

#pragma mark -setter Or Getter
-(void)setTitle:(NSString *)title{
    
    _title = title;
    _titleLabel.text = title;
}

-(void)setHidenCloseButton:(BOOL)hidenCloseButton{
    _hidenCloseButton = hidenCloseButton;
    self.closeButton.hidden = hidenCloseButton;
}

-(void)setHidenBackupButton:(BOOL)hidenBackupButton{
    _hidenBackupButton = hidenBackupButton;
    self.backupButton.hidden = hidenBackupButton;
}

#pragma mark -Life

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
    
        [self setupSubviews];
        [self setNeedsLayout];
    }
    return self;
}

#pragma mark -config

-(void)setupSubviews{
    
    //标题
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    self.titleLabel.tag = 111;
    self.titleLabel.text = self.title;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.textColor = [UIColor colorWithRed:50/255.0 green:50/255.0 blue:50/255.0 alpha:1.0f];
    self.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:18.0f];
    [self addSubview:self.titleLabel];
    
    //关闭按钮
    self.closeButton = [self createButon];
    [self.closeButton setTitle:@"Close" forState:UIControlStateNormal];
    [self.closeButton addTarget:self action:@selector(dismissThisView) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.closeButton];
    
    //返回按钮
    self.backupButton = [self createButon];
    self.backupButton.tag = 113;
    self.backupButton.hidden = NO;
   [self.backupButton setTitle:@"返回" forState:UIControlStateNormal];
   // UIImage *image = [UIImage imageNamed:@"arrowBack"];
   // self.backupButton.layer.contents = (id)image.CGImage;
    [self.backupButton addTarget:self action:@selector(backToFrontView) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.backupButton];
    
    //横线
    self.line = [[UIImageView alloc]initWithFrame:CGRectZero];
    self.line.tag = 114;
    self.line.backgroundColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1.0f];
    [self addSubview:self.line];
    
    //展示详情tableview
    CGRect tableFrame = CGRectZero;
    self.infoTableView = [[UITableView alloc] initWithFrame:tableFrame style:UITableViewStylePlain];
    self.infoTableView.backgroundColor = [UIColor clearColor];
    self.infoTableView.bounces = NO;
    self.infoTableView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.infoTableView.tableFooterView = [[UIView alloc] init];
    [self addSubview:self.infoTableView];
    
}

#pragma mark -Action
- (void)dismissThisView{
    if (self.closeBlock) {
        self.closeBlock();
    }
}

- (void)backToFrontView{
    
    if (self.backupBlock) {
        self.backupBlock();
    }
}

#pragma mark -Public


#pragma mark - Private
- (UIButton *)createButon{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectZero;
    [btn setTitleColor:[UIColor colorWithRed:151.0/255 green:151.0/255 blue:151.0/255 alpha:1.0f] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    return btn;
}
#pragma mark -Overload
- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    CGFloat paymentWidth = self.bounds.size.width;
    CGFloat tableHeight = 270;
    
    CGFloat btnXpiex;
    
    CGFloat buttonWH = 12;
    btnXpiex = self.frame.size.width - 20 - buttonWH;
    
    CGRect titleFrame = CGRectMake(0, 0, paymentWidth, kCardTitleHeight);
    CGRect lineFrame = CGRectMake(0, kCardTitleHeight-1.0f, paymentWidth, 1.0f);
    CGRect tableFrame = CGRectMake(0, kCardTitleHeight, self.frame.size.width, tableHeight);
    
    CGRect cancelFrame = CGRectMake(btnXpiex, (kCardTitleHeight-buttonWH)/2, buttonWH, buttonWH);
    CGRect backFrame = CGRectMake(5, 0, kCardTitleHeight, kCardTitleHeight);
    
    self.titleLabel.frame = titleFrame;
    self.closeButton.frame = cancelFrame;
    self.backupButton.frame = backFrame;
    self.line.frame = lineFrame;
    self.infoTableView.frame = tableFrame;
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



@end
