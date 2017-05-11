//
//  MLPayModel.m
//  TestCode
//
//  Created by 蔡杰 on 2017/5/9.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#import "MLPayModel.h"

@implementation MLPayModel

-(instancetype)init{
    self = [super init];
    if (self) {
        
        _type = MLPayModelTypeDefault;
        _title =@"";
        _content = @"";
    }
    return self;
}

@end
