//
//  MLCountdownButton.h
//  TestCode
//
//  Created by 蔡杰 on 2017/5/10.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MLCountdownButton : UIButton

/**
 设置显示的内容
 
 @param beginningTitle 开始的文字
 @param timeCount 计时数(sec)
 @param finishedTitle 计时结束的文字
 */
- (void)setBeginningTitle:(NSString *)beginningTitle
                timeCount:(NSInteger)timeCount
            finishedTitle:(NSString *)finishedTitle;

/**
 开始倒计时
 */
- (void)startCountdown;

/**
 取消倒计时（若控制器dealloc，需调用该方法，防止内存泄漏）
 */
- (void)cancelCountDown;

@end
