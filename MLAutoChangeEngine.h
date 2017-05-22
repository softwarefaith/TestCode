//
//  MLAutoChangeEngine.h
//  ChangeNunTest
//
//  Created by  on 2017/5/19.
//  Copyright © 2017年  All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

extern NSString *const kMLCounterAnimationOptions;

typedef void(^MLCompletionBlock)(CGFloat endNumber);

typedef void(^MLCurrentNumberBlock)(CGFloat currentNumber);

typedef NSString *(^MLFormatBlock)(CGFloat currentNumber);

typedef NSAttributedString *(^MLAttributedFormatBlock)(CGFloat currentNumber);

typedef NS_ENUM(NSUInteger, MLCounterAnimationOptions) {
    /** 由慢到快,再由快到慢*/
    MLCounterAnimationOptionCurveEaseInOut = 1,
    /** 由慢到快*/
    MLCounterAnimationOptionCurveEaseIn,
    /** 由快到慢*/
    MLCounterAnimationOptionCurveEaseOut,
    /** 匀速*/
    MLCounterAnimationOptionCurveLinear
};


@interface MLAutoChangeEngine : NSObject

+ (instancetype)counterEngine;
/**
 在指定时间内数字从 numberA -> numberB
 
 @param starNumer           开始的数字
 @param endNumber           结束的数字
 @param duration            指定的时间
 @param animationOptions    动画类型
 @param currentNumber       当前数字的回调
 @param completion          已完成的回调
 */
- (void)fromNumber:(CGFloat)starNumer
          toNumber:(CGFloat)endNumber
          duration:(CFTimeInterval)duration
  animationOptions:(MLCounterAnimationOptions)animationOptions
     currentNumber:(MLCurrentNumberBlock)currentNumber
        completion:(MLCompletionBlock)completion;

@end
