//
//  MLCountdownButton.m
//  TestCode
//
//  Created by 蔡杰 on 2017/5/10.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#import "MLCountdownButton.h"

@implementation MLCountdownButton{
        NSString *_finishedTitle;
        NSInteger _count;
        dispatch_source_t _timer;

}
- (void)setBeginningTitle:(NSString *)beginningTitle
                timeCount:(NSInteger)timeCount
            finishedTitle:(NSString *)finishedTitle
{
    [self setTitle:beginningTitle forState:UIControlStateNormal];
    _count = timeCount;
    _finishedTitle = finishedTitle;
}

- (void)startCountdown
{
    NSLog(@"倒计时开始");
    
    __block NSInteger tmpCount = _count;
    
    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0));
    
    dispatch_source_set_timer(_timer, DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);

    typeof(self) weakSelf = self;
    dispatch_source_set_event_handler(_timer, ^{
        
        typeof(weakSelf) strongSelf = self;
        if (tmpCount == 0) {
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                [strongSelf setTitle:_finishedTitle forState:UIControlStateNormal];
                strongSelf.enabled = YES;
            });
        }else {
            dispatch_async(dispatch_get_main_queue(), ^{
                [strongSelf setTitle:[NSString stringWithFormat:@"%zds后重发",tmpCount--] forState:UIControlStateNormal];
            });
        }
    });
    dispatch_resume(_timer);
}

- (void)cancelCountDown
{
    if (_timer) {
        dispatch_source_cancel(_timer);
        _timer = nil;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
