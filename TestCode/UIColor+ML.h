//
//  UIColor+Color.h
//  MLQKFrame
//
//  Created by allen_zhang on 3/7/16.
//  Copyright © 2016 com.mljr. All rights reserved.
//

#import <UIKit/UIKit.h>

#define MLColor16(r)         [UIColor colorWithRGB:r]
#define MLColorRGBSame(r)    [UIColor colorWithRed:r/255.0 green:r/255.0 blue:r/255.0 alpha:1.0]
#define MLColorRGB(r,g,b)    [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define MLColorRGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

@interface UIColor (ML)

+ (UIColor *)colorWithHexString:(NSString *)hexStr;
+ (UIColor *)colorWithRGB:(uint32_t)rgbValue;
+ (UIColor *)colorWithRGB:(uint32_t)rgbValue alpha:(CGFloat)alpha;

@end
