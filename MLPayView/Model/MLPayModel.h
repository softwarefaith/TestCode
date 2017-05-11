//
//  MLPayModel.h
//  TestCode
//
//  Created by 蔡杰 on 2017/5/9.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,MLPayModelType){
    MLPayModelTypeDefault,
    MLPayModelTypeBackCard
};

@interface MLPayModel : NSObject

@property (nonatomic,assign) MLPayModelType type;

@property (nonatomic,copy) NSString *content;

@property (nonatomic,copy) NSString *title;

@property (nonatomic,strong) id extra;

@end
