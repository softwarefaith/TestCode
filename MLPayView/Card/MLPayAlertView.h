//
//  MLPayAlertView.h
//  TestCode
//
//  Created by 蔡杰 on 2017/5/9.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#import "MLCardInfo.h"

@class MLPayModel;

typedef NS_ENUM(NSInteger,MLPayAlertType){
    
    MLPayAlertTypePatment = 0,
    MLPayAlertTypeBankCard = 1
    
};

@interface MLPayAlertView : MLCardInfo

@property (nonatomic,assign) MLPayAlertType alertType;

@property (nonatomic,strong) NSMutableArray *dataSource;

@property (nonatomic,copy) void (^ choosePayCardBlock)(MLPayModel *model);

@property (nonatomic, copy) void(^changeFrameBlock)(CGFloat interHeight);


@end
