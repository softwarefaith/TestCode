//
//  MLAutomationChangeLabel.m
//  ChangeNunTest
//
//  Created by 刘聪 on 2017/5/18.
//  Copyright © 2017年 liu_cong. All rights reserved.
//

#import "MLAutoChangeLabel.h"

NSString *const kMLCounterAnimationOptions = @"kMLCounterAnimationOptions";

@implementation MLAutoChangeLabel

- (void)changeFromNumber:(CGFloat)numberA toNumber:(CGFloat)numberB duration:(CFTimeInterval)duration format:(MLFormatBlock)format {
    [self changeFromNumber:numberA toNumber:numberB duration:duration animationOptions:MLCounterAnimationOptionCurveEaseInOut format:format completion:nil];
}

- (void)changeFromNumber:(CGFloat)numberA toNumber:(CGFloat)numberB duration:(CFTimeInterval)duration format:(MLFormatBlock)format completion:(MLCompletionBlock)completion {
    [self changeFromNumber:numberA toNumber:numberB duration:duration animationOptions:MLCounterAnimationOptionCurveEaseInOut format:format completion:completion];
}

- (void)changeFromNumber:(CGFloat)numberA toNumber:(CGFloat)numberB duration:(CFTimeInterval)duration attributedFormat:(MLAttributedFormatBlock)attributedFormat {
    [self changeFromNumber:numberA toNumber:numberB duration:duration animationOptions:MLCounterAnimationOptionCurveEaseInOut attributedFormat:attributedFormat completion:nil];
}

- (void)changeFromNumber:(CGFloat)numberA toNumber:(CGFloat)numberB duration:(CFTimeInterval)duration attributedFormat:(MLAttributedFormatBlock)attributedFormat completion:(MLCompletionBlock)completion {
    [self changeFromNumber:numberA toNumber:numberB duration:duration animationOptions:MLCounterAnimationOptionCurveEaseInOut attributedFormat:attributedFormat completion:completion];
}

#pragma mark - normal font
- (void)changeFromNumber:(CGFloat)numberA
             toNumber:(CGFloat)numberB
             duration:(CFTimeInterval)duration
     animationOptions:(MLCounterAnimationOptions)animationOptions
               format:(MLFormatBlock)format
           completion:(MLCompletionBlock)completion {
    if (self.animationOptions) {
        animationOptions = self.animationOptions;
    }
    [[MLAutoChangeEngine counterEngine] fromNumber:numberA toNumber:numberB duration:duration animationOptions:animationOptions currentNumber:^(CGFloat number) {
        format ? self.text = format(number) : nil ;
    } completion:completion];
}

#pragma mark - attributed font
- (void)changeFromNumber:(CGFloat)numberA
             toNumber:(CGFloat)numberB
             duration:(CFTimeInterval)duration
     animationOptions:(MLCounterAnimationOptions)animationOptions
     attributedFormat:(MLAttributedFormatBlock)attributedFormat
           completion:(MLCompletionBlock)completion {
    if (self.animationOptions) {
        animationOptions = self.animationOptions;
    }
    [[MLAutoChangeEngine counterEngine] fromNumber:numberA toNumber:numberB duration:duration animationOptions:animationOptions currentNumber:^(CGFloat number) {
        attributedFormat ? self.attributedText = attributedFormat(number) : nil ;
    } completion:completion];
}


@end
