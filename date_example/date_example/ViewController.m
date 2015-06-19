//
//  ViewController.m
//  date_example
//
//  Created by mac on 6/18/15.
//  Copyright (c) 2015 VKan. All rights reserved.
//

#import "ViewController.h"

#import <Foundation/Foundation.h>
#import "VKDateManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
//    NSDate *date = [NSDate date];
//    
//    NSDate *date1 = [NSDate dateWithTimeIntervalSinceNow:60 * 60];
//    
//    NSDate *date2 = [NSDate dateWithTimeInterval:1 sinceDate:date];
//    
//    //2001-1-1 00:00:00 GMT 格林尼治标准时间
//    NSDate *date3 = [NSDate dateWithTimeIntervalSinceReferenceDate:1];
//    //1970-1-1 00:00:00 GMT 格林尼治标准时间
//    NSDate *date4 = [NSDate dateWithTimeIntervalSince1970:1];
//    
//    NSDate *date5 = [NSDate distantFuture];
//    
//    NSDate *date6 = [NSDate distantPast];
//
//    
//    NSTimeInterval timeIntervalnow = [date timeIntervalSinceNow];
//    NSTimeInterval timeInterval1970 = [date timeIntervalSince1970];
//    
//    
//    NSDate *dateAddTimeInterval = [date dateByAddingTimeInterval:-60*5];
//    //比较谁更早,返回更早的 date
//    NSDate *earlierDate = [date earlierDate:date1];
//    
//    //比较是否相同 NSOrderedSame
//    NSComparisonResult datecompare = [date compare:date];
    
    __unused NSString *systemTime = [VKDateManager vk_systemTimeType:DateFormatTypeHMS];
    
    __unused NSString *systemTimeInterval = [VKDateManager vk_systemTimeInterval];
    
    __unused NSString *time1 = [VKDateManager vk_convertTimeIntervalToTime:@"60" formatType:DateFormatTypeYMDHM];
    
    __unused NSString *custom_timeInterval = [VKDateManager vk_convertTimeToTimeInterval:@"1970-01-01 09:00:00" formatType:DateFormatTypeYMDHMS timeZone:TimeZoneTypeSystem];
    
    __unused NSString *intervalSince = [VKDateManager vk_intervalSinceNow:@"1434676813"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
