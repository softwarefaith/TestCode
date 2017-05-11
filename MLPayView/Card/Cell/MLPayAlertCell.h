//
//  MLPayAlertCell.h
//  TestCode
//
//  Created by 蔡杰 on 2017/5/9.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MLPayModel.h"

@interface MLPayAlertCell : UITableViewCell

@property (nonatomic,strong) UIImageView *icon;


- (void)configWithModel:(MLPayModel *)model;

@end
