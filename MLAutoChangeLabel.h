//
//  MLAutomationChangeLabel.h
//  ChangeNunTest
//
//  Created by 刘聪 on 2017/5/18.
//  Copyright © 2017年 liu_cong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MLAutoChangeEngine.h"

@interface MLAutoChangeLabel : UILabel

/** 动画类型*/
@property (nonatomic, assign) MLCounterAnimationOptions animationOptions;

#pragma mark - normal

/**
 正常字体属性UILabel中的数字在指定时间从 numberA -> numberB,
 
 @param numberA     开始的数字
 @param numberB     结束的数字
 @param duration    持续时间
 @param format      设置字体一般属性的Block
 */
- (void)changeFromNumber:(CGFloat)numberA
             toNumber:(CGFloat)numberB
             duration:(CFTimeInterval)duration
               format:(MLFormatBlock)format;

/**
 1.正常字体属性UILabel中的数字在指定时间从 numberA -> numberB,
 2.有结束回调
 
 @param numberA    开始的数字
 @param numberB    结束的数字
 @param duration   持续时间
 @param format     设置一般字体的Block
 @param completion 完成的Block
 */
- (void)changeFromNumber:(CGFloat)numberA
             toNumber:(CGFloat)numberB
             duration:(CFTimeInterval)duration
               format:(MLFormatBlock)format
           completion:(MLCompletionBlock)completion;

/**
 1.正常字体属性UILabel中的数字在指定时间从 numberA -> numberB,
 2.可设置动画类型,
 3.有结束回调
 
 @param numberA             开始的数字
 @param numberB             结束的数字
 @param duration            持续时间
 @param animationOptions    动画类型
 @param format              设置字体一般属性的block
 @param completion          完成的block
 */
- (void)changeFromNumber:(CGFloat)numberA
             toNumber:(CGFloat)numberB
             duration:(CFTimeInterval)duration
     animationOptions:(MLCounterAnimationOptions)animationOptions
               format:(MLFormatBlock)format
           completion:(MLCompletionBlock)completion;


#pragma mark - attributed

/**
 富文本字体属性UILabel中的数字在指定时间从 numberA -> numberB,
 
 @param numberA               开始的数字
 @param numberB               结束的数字
 @param duration              持续时间
 @param attributedFormat 设置富文本字体属性的Block
 */
- (void)changeFromNumber:(CGFloat)numberA
             toNumber:(CGFloat)numberB
             duration:(CFTimeInterval)duration
     attributedFormat:(MLAttributedFormatBlock)attributedFormat;

/**
 1.富文本字体属性UILabel中的数字在指定时间从 numberA -> numberB,
 2.有结束回调
 
 @param numberA          开始的数字
 @param numberB          结束的数字
 @param duration         持续时间
 @param attributedFormat 设置富文本字体属性的Block
 @param completion       完成的Block
 */

- (void)changeFromNumber:(CGFloat)numberA
             toNumber:(CGFloat)numberB
             duration:(CFTimeInterval)duration
     attributedFormat:(MLAttributedFormatBlock)attributedFormat
           completion:(MLCompletionBlock)completion;

/**
 1.富文本字体属性UILabel中的数字在指定时间从 numberA -> numberB,
 2.可设置动画类型,
 3.有结束回调
 
 @param numberA            开始的数字
 @param numberB            结束的数字
 @param duration           持续时间
 @param animationOptions   动画类型
 @param attributedFormat   设置富文本字体属性的Block
 @param completion         完成的Block
 */
- (void)changeFromNumber:(CGFloat)numberA
             toNumber:(CGFloat)numberB
             duration:(CFTimeInterval)duration
     animationOptions:(MLCounterAnimationOptions)animationOptions
     attributedFormat:(MLAttributedFormatBlock)attributedFormat
           completion:(MLCompletionBlock)completion;

@end

