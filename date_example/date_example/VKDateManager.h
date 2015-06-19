//
//  VKDateManager.h
//  date_example
//
//  Created by mac on 6/19/15.
//  Copyright (c) 2015 VKan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, DateFormatType) {
    DateFormatTypeYMD,      //年月日 yyyy-MM-dd
    DateFormatTypeYMDHM,    //年月日时分 yyyy-MM-dd HH:mm
    DateFormatTypeYMDHMS,   //年月日时分秒 yyyy-MM-dd HH:mm:ss
    DateFormatTypeHM,       //时分 HH:mm
    DateFormatTypeHMS,      //时分秒 HH:mm:ss
};

typedef NS_ENUM(NSUInteger, TimeZoneType) {
    TimeZoneTypeSystem,
    TimeZoneTypeShanghai,
    TimeZoneTypeGMT,
};
@interface VKDateManager : NSObject

+ (NSDateFormatter *)vk_standDateFormatter;
+ (NSDateFormatter *)vk_standDateFormatterType:(DateFormatType)type
                                      timeZone:(TimeZoneType)timezoneType;

//系统时间
+ (NSString *)vk_systemTimeType:(DateFormatType)type;
//系统时间 时间戳
+ (NSString *)vk_systemTimeInterval;

//时间戳->标准时间
/**
 *  用于 app 端显示
 */
+ (NSString *)vk_convertTimeIntervalToTime:(NSString *)timeInterval
                                formatType:(DateFormatType)type;
/**
 *  如果服务器需要上传标准时间,选择对应服务器timeZone
 */
+ (NSString *)vk_convertTimeIntervalToTime:(NSString *)timeInterval
                                formatType:(DateFormatType)type
                                  timeZone:(TimeZoneType)timezoneType;
//标准时间->时间戳
/**
 *  如果服务器返回的是,标准时间类型的话,需要选择成服务器对应timeZone
 */
+ (NSString *)vk_convertTimeToTimeInterval:(NSString *)time
                                formatType:(DateFormatType)type
                                  timeZone:(TimeZoneType)timezoneType;

//多久之前
+ (NSString *)vk_intervalSinceNow:(NSString *)timeInterval;
@end
