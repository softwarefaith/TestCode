//
//  MLCurrencyTextField.h
//  TestCode
//
//  Created by 蔡杰 on 2017/4/21.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MLCurrencyTextField : UITextField

@property (strong, nonatomic, readonly) NSNumberFormatter   *numberFormatter;

/**
 * The decimal number that user typed.0 */
@property (strong, nonatomic) NSDecimalNumber               *numberValue;

@end


/*

 textField.placeholder = @"username is in here!";
 [textField setValue:[UIColor redColor] forKeyPath:@"_placeholderLabel.textColor"];
 [textField setValue:[UIFont boldSystemFontOfSize:16] forKeyPath:@"_placeholderLabel.font"];

*/
