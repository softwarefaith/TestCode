//
//  MLTransAnimationView.m
//  TestCode
//
//  Created by 蔡杰 on 2017/5/9.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#import "MLTransferAnimationView.h"
#import "AppDelegate.h"

@implementation MLTransferAnimationView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)showInView:(UIView *)superView{
    [superView addSubview:self];
    
    [self showDefaultAction];

}

-(void)showInKeyWindow{
    
    [self showInView:[UIApplication sharedApplication].keyWindow];
    
}

-(void)dismissWithCurrentView:(UIView *)currentView{

    if (currentView == nil) {
        [UIView animateWithDuration:0.5 animations:^{
            self.alpha = 0;
            
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
        return;
    }

    [UIView animateWithDuration:0.5 animations:^{
        currentView.alpha = 0.0;
       self.alpha = 0;

    } completion:^(BOOL finished) {
        [self removeFromSuperview];

    }];
    
}

-(void)transformDirection:(BOOL)isLeft withCurrentView:(UIView *)currentView withLastView:(UIView *)lastView{
    
    switch (self.transferAnimationType) {
        case MLTransferAnimationTypeSlide:{
            
            [self slideDirection:isLeft withCurrentView:currentView withLastView:lastView];
            break;
        }
            break;
            
        default:
            break;
    }
    
    
}
#pragma mark - private animation method
//滑动切换视图
- (void)slideDirection:(BOOL)isLeft withCurrentView:(UIView *)currentView withLastView:(UIView *)lastView {
    
    CGFloat offset = self.frame.size.width;
    CGAffineTransform leftTransform = CGAffineTransformMakeTranslation(-offset, 0);
    CGAffineTransform rightTransform = CGAffineTransformMakeTranslation(offset, 0);
    CGAffineTransform currentTransform,lastTransform;
    if (isLeft) {
        currentTransform = leftTransform;
        lastTransform = rightTransform;
    } else {
        lastTransform = leftTransform;
        currentTransform = rightTransform;
    }
    
    lastView.transform = lastTransform;
    lastView.hidden = NO;
    
    [UIView animateWithDuration:self.animationTime animations:^{
        currentView.transform = currentTransform;
        lastView.transform = CGAffineTransformIdentity;
    }];
}



@end


@implementation MLTransferAnimationView (MLExtetion)

-(void)showDefaultAction{
    
}

@end
