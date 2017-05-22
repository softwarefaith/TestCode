//
//  AppDelegate.m
//  TestCode
//
//  Created by 蔡杰 on 17/3/16.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#import "AppDelegate.h"

#import "B.h"

@interface AppDelegate ()

@end

@implementation AppDelegate{
    
    
}

-(void)dosomething{
    
    NSLog(@"你好");
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
  
    
    return YES;
}
-(void)setB:(NSString*)name{
    NSLog(@"我被调用了---%@",name);
}
- (void)setNameWithFormat:(NSString *)format, ... {
    
    NSCParameterAssert(format != nil);
    
    va_list args;
    va_start(args, format);
    
    NSString *str = [[NSString alloc] initWithFormat:format arguments:args];
    va_end(args);
    NSLog(@"123234===%@",str);
    
    
   // NSLog(@"我是 == %d",[self testTry]);
    
    NSNumber *number = [self testTry11];
    NSLog(@"我是 == %@",[self testTry11]);

}

- (int)testTry{
    int i= 0;
    @try {
        ++i;
        return i;
    } @catch (NSException *exception) {
        
    } @finally {
        ++i;
    }
    
    
}
- (id)testTry11{
    NSNumber *i= [NSNumber alloc] ;;
    @try {
        
        return i;
    } @catch (NSException *exception) {
        
    } @finally {
        i = [NSNumber numberWithInteger:5];
    }
    
    
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
