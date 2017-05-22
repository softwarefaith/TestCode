//
//  MLAdjustAmountView.h
//  TestCode
//
//  Created by 蔡杰 on 2017/5/22.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MLAdjustAmountView : UIView

@property (nonatomic,assign) CGFloat toNumber;

/**
 视图显示
 */

- (void)showInKeyWindow;

- (void)showInView:(UIView *_Nonnull )superView;


@property (nonatomic,copy) dispatch_block_t _Nullable closeCallBack;

@property (nonatomic,copy) dispatch_block_t _Nullable lookupAmountCallBack;


@end
