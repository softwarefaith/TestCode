//
//  MLCurrencyTextField.m
//  TestCode
//
//  Created by 蔡杰 on 2017/4/21.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#import "MLCurrencyTextField.h"

/*
 
 1.要求用户输入首位不能为小数点;
 
 2.小数点后不超过两位，小数点无法输入超过一个;
 
 3.如果首位为0，后面仅能输入小数点
 
 4.输入金额不超过11位
 

 */



@interface MLCurrencyTextField()<UITextFieldDelegate>


@end
@implementation MLCurrencyTextField

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        [self commomInit];
    }
    return self;
}

-(void)commomInit{
    
    self.keyboardType = UIKeyboardTypeDecimalPad;
    self.textAlignment = NSTextAlignmentLeft;
    _numberFormatter = [[NSNumberFormatter alloc] init];
    _numberFormatter.minimumFractionDigits = 2;
    [super setDelegate:self];
    
    self.leftViewMode = UITextFieldViewModeAlways;
    UILabel *curreny = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 14, 30)];
    curreny.text = @"$";
    curreny.font = [UIFont systemFontOfSize:22.0];
    self.leftView = curreny;
     self.rightViewMode = UITextFieldViewModeWhileEditing;
    UIButton *clearButton = [UIButton buttonWithType:UIButtonTypeCustom];
    clearButton.frame = CGRectMake(0, 0, 20, 20);
    clearButton.backgroundColor = [UIColor greenColor];
    [clearButton addTarget:self action:@selector(clearTextField:) forControlEvents:UIControlEventTouchUpInside];
    self.rightView = clearButton;
    
}

#pragma mark - Override
-(void)drawRect:(CGRect)rect{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [[UIColor greenColor] set];//设置下划线颜色 这里是红色 可以自定义
    
    CGFloat y = CGRectGetHeight(self.frame);
    CGContextMoveToPoint(context, 0, y);
    CGContextAddLineToPoint(context, CGRectGetWidth(self.frame), y);
    //设置线的宽度
    CGContextSetLineWidth(context, 1);
    //渲染 显示到self上
    CGContextStrokePath(context);
}

- (CGRect)leftViewRectForBounds:(CGRect)bounds
{
    CGRect iconRect = [super leftViewRectForBounds:bounds];
    iconRect.origin.y -= 8; //
    return iconRect;
}
#pragma mark -Action

- (void)clearTextField:(id)sender{
    self.text = @"";
}

#pragma mark -UITextFieldDelegate

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    
    if (textField.text.length > 10) {
        return range.location < 11;
    }else{
        BOOL isHaveDian = YES;
        if ([textField.text rangeOfString:@"."].location==NSNotFound) {
            isHaveDian=NO;
        }
        if ([string length]>0)
        {
            unichar single=[string characterAtIndex:0];//当前输入的字符
            
            if ((single >='0' && single<='9') || single=='.')//数据格式正确
            {
                //首字母不能为小数点
                if([textField.text length]==0){
                    if(single == '.'){
                        [textField.text stringByReplacingCharactersInRange:range withString:@""];
                        return NO;
                        
                    }
                }
                if([textField.text length]==1 && [textField.text isEqualToString:@"0"]){
                    if(single != '.'){
                        [textField.text stringByReplacingCharactersInRange:range withString:@""];
                        return NO;
                        
                    }
                }
                if (single=='.')
                {
                    if(!isHaveDian)//text中还没有小数点
                    {
                        isHaveDian=YES;
                        return YES;
                    }else
                    {
                        [textField.text stringByReplacingCharactersInRange:range withString:@""];
                        return NO;
                    }
                }
                else
                {
                    if (isHaveDian)//存在小数点
                    {
                        //判断小数点的位数
                        NSRange ran=[textField.text rangeOfString:@"."];
                        NSInteger tt=range.location-ran.location;
                        if (tt <= 2){
                            return YES;
                        }else{
                            return NO;
                        }
                    }
                    else
                    {
                        return YES;
                    }
                }
            }else{//输入的数据格式不正确
                [textField.text stringByReplacingCharactersInRange:range withString:@""];
                return NO;
            }
        }
        else
        {
            return YES;
        }
    }
}

#pragma mark - Public Methods

- (void)setNumberValue:(NSDecimalNumber *)numberValue
{
    if (nil == numberValue || [numberValue compare:[NSDecimalNumber zero]] == NSOrderedSame || [numberValue compare:[NSDecimalNumber notANumber]] == NSOrderedSame) {
        self.text = nil;
    } else {
        self.text = [_numberFormatter stringFromNumber:numberValue];
    }
}

- (NSDecimalNumber *)numberValue
{
    if (self.text.length == 0) {
        return [NSDecimalNumber decimalNumberWithDecimal:[_numberFormatter numberFromString:@""].decimalValue];
    }
    NSDecimal decimal = [_numberFormatter numberFromString:self.text].decimalValue;
    return [NSDecimalNumber decimalNumberWithDecimal:decimal];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
