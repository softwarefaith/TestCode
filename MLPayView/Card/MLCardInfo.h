//
//  MLCardInfo.h
//  TestCode
//
//  Created by 蔡杰 on 2017/5/9.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MLCardInfo : UIView

@property (nonatomic,copy) NSString *title;

@property (nonatomic,strong) UITableView *infoTableView;

@property (nonatomic,copy)dispatch_block_t backupBlock;

@property (nonatomic,copy)dispatch_block_t closeBlock;

@property (nonatomic,assign) BOOL hidenBackupButton;

@property (nonatomic,assign) BOOL hidenCloseButton;

@property (nonatomic,assign) BOOL state;

@end
