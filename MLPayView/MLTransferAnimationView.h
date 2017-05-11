//
//  MLTransAnimationView.h
//  TestCode
//
//  Created by 蔡杰 on 2017/5/9.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#import <UIKit/UIKit.h>

//两页面切换效果
typedef NS_ENUM(NSInteger,MLTransferAnimationType){
    MLTransferAnimationTypeSlide = 0,//滑动，替换
};

NS_ASSUME_NONNULL_BEGIN
@interface MLTransferAnimationView : UIView

@property(nonatomic,assign) MLTransferAnimationType transferAnimationType;

@property(nonatomic,assign) NSTimeInterval animationTime;

/**
     视图显示
 */

- (void)showInKeyWindow;


- (void)showInView:(UIView *_Nonnull )superView;


/**
 *  使当前视图消失
 *
 *  @param currentView 当前视图
 */
- (void)dismissWithCurrentView:(UIView *)currentView;


/**
 *  切换视图
 *
 *  @param currentView 当前视图
 *  @param lastView    将要展现的视图
 */
- (void)transformDirection:(BOOL)isLeft withCurrentView:(UIView *)currentView withLastView:(UIView *)lastView;


@end


@interface MLTransferAnimationView (MLExtetion)

//子类覆盖 实现显示一些自定义操作
- (void)showDefaultAction;

@end


NS_ASSUME_NONNULL_END
