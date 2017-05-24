//
//  MLAdjustAmountView.h
//  TestCode
//
//  Created by 蔡杰 on 2017/5/22.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MLMaskBlurView.h"

@interface MLAdjustAmountView : MLMaskBlurView

@property (nonatomic,assign) CGFloat toNumber;

@property (nonatomic,copy) dispatch_block_t _Nullable closeCallBack;

@property (nonatomic,copy) dispatch_block_t _Nullable lookupAmountCallBack;

@end
