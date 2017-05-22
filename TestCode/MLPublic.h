//
//  MLPublic.h
//  PDLoan
//
//  Created by zengzoe on 20/02/2017.
//  Copyright © 2017 KFG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MLPublic : NSObject

// 输入字符串，字体大小，限制宽度 得出高度
+ (CGSize)string:(NSString*)aStr withFont:(UIFont *)aFont withLimitWidth:(CGFloat)aLimitWidth;
//根据字体大小，获取字符串宽度，适用于常规平方字体
+ (CGSize)string:(NSString*)aStr withFontSize:(CGFloat)aSize;
//根据字体，获取字符串宽度
+ (CGSize)string:(NSString*)aStr withFontSize:(CGFloat)aSize FontName:(NSString *)fontName;
// 通过颜色创建图片
+ (UIImage *)createImageWithColor:(UIColor *)color;
// 创建Regular常规平方字体
+ (UIFont *)createRegularPingFangFontWithSize:(CGFloat)size;
// 创建加粗的平方字体
+ (UIFont *)createBoldRegulePingFangFontWithSize:(CGFloat)size;
// 根据字体名称创建字体
+ (UIFont *)createCustomFontWithFontName:(NSString *)fontName Size:(CGFloat)size;
+ (BOOL)isHigherIOS7;

@end
