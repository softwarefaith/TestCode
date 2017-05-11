//
//  MLPaymentView.h
//  TestCode
//
//  Created by 蔡杰 on 2017/5/9.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#import "MLTransferAnimationView.h"

@class MLPaymentView;

typedef NS_ENUM(NSInteger,paymentActionType){
    
    paymentActionTypeDecideToPay,
    paymentActionTypeSendVerCode,
    paymentActionTypeCapchVerCode,
    paymentActionTypeAddCard
};

@protocol MLPaymentDelegate <NSObject>

- (void)paymentView:(MLPaymentView *)paymentView action:(paymentActionType)actionType param:(id)param;

@end

@interface MLPaymentView : MLTransferAnimationView

@property (nonatomic,strong) id <MLPaymentDelegate> delegate;

- (void)reloadPaymentViewWithAmount:(NSString *)payAmount bankCardInfo:(id)param;

- (void)addBankCardInfo:(id)param;

- (void)dismiss;

@end
