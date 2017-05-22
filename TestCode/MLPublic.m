//
//  MLPublic.m
//  PDLoan
//
//  Created by zengzoe on 20/02/2017.
//  Copyright © 2017 KFG. All rights reserved.
//

#import "MLPublic.h"

@implementation MLPublic

//输入字符串，字体大小，限制宽度 得出高度
+ (CGSize)string:(NSString*)aStr withFont:(UIFont *)aFont withLimitWidth:(CGFloat)aLimitWidth {
    NSMutableParagraphStyle* paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attributes = @{NSFontAttributeName:aFont, NSParagraphStyleAttributeName:paragraphStyle};
    CGSize stringSize = [aStr boundingRectWithSize:CGSizeMake(aLimitWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    return stringSize;
}

//根据字体大小，获取字符串宽度，适用于常规平方字体
+ (CGSize)string:(NSString*)aStr withFontSize:(CGFloat)aSize {
    CGSize stringSize = [aStr sizeWithAttributes:@{ NSFontAttributeName:[MLPublic createRegularPingFangFontWithSize:aSize]}];
    return stringSize;
}

//根据字体，获取字符串宽度
+ (CGSize)string:(NSString*)aStr withFontSize:(CGFloat)aSize FontName:(NSString *)fontName {
    CGSize stringSize = [aStr sizeWithAttributes:@{ NSFontAttributeName:[MLPublic createCustomFontWithFontName:fontName Size:aSize]}];
    return stringSize;
}

//UIcolor to UIImage
+ (UIImage *)createImageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}

+ (UIFont *)createRegularPingFangFontWithSize:(CGFloat)size {
    UIFont *font = [UIFont fontWithName:@"PingFangSC-Regular" size:size];
    if (!font) {
        font = [UIFont systemFontOfSize:size];
    }
    return font;
}

+ (UIFont *)createBoldRegulePingFangFontWithSize:(CGFloat)size {
    UIFont *font = [UIFont fontWithName:@"PingFangSC-Semibold" size:size];
    if (!font) {
        font = [UIFont systemFontOfSize:size];
    }
    return font;
}

+ (UIFont *)createCustomFontWithFontName:(NSString *)fontName Size:(CGFloat)size {
    UIFont *font = [UIFont fontWithName:fontName size:size];
    if (!font) {
        font = [UIFont systemFontOfSize:size];
    }
    return font;
}

+ (BOOL)isHigherIOS7 {
    NSString *requestSysVer = @"7.0";
    NSString *currentSysVer = [[UIDevice currentDevice] systemVersion];
    if ([currentSysVer compare:requestSysVer options:NSNumericSearch] == NSOrderedAscending) {
        return NO;
    }
    return YES;
}


@end
