//
//  VKDateManager.m
//  date_example
//
//  Created by mac on 6/19/15.
//  Copyright (c) 2015 VKan. All rights reserved.
//

#import "VKDateManager.h"

@implementation VKDateManager

+ (NSDateFormatter *)vk_standDateFormatter{
   
    return [VKDateManager vk_standDateFormatterType:DateFormatTypeYMDHMS
                                           timeZone:TimeZoneTypeSystem];
}

+ (NSDateFormatter *)vk_standDateFormatterType:(DateFormatType)type
                                      timeZone:(TimeZoneType)timezoneType{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:[VKDateManager getDateFormatType:type]];
    [dateFormatter setTimeZone:[VKDateManager getTimeZoneType:timezoneType]];
    return dateFormatter;
}

//系统时间
+ (NSString *)vk_systemTimeType:(DateFormatType)type{
    NSDateFormatter *dateFormatter = [VKDateManager vk_standDateFormatterType:type
                                                                     timeZone:TimeZoneTypeSystem];
    NSString *systemTime = [dateFormatter stringFromDate:[NSDate date]];
    return systemTime;
}
//系统时间 时间戳
+ (NSString *)vk_systemTimeInterval{
    NSDate *date = [NSDate date];
    NSTimeInterval timeInterval = [date timeIntervalSince1970];
    NSString *timeIntervalStr = [NSString stringWithFormat:@"%ld",(long)timeInterval];
    return timeIntervalStr;
}

//时间戳->标准时间
+ (NSString *)vk_convertTimeIntervalToTime:(NSString *)timeInterval
                                formatType:(DateFormatType)type{
    return [VKDateManager vk_convertTimeIntervalToTime:timeInterval
                                            formatType:type
                                              timeZone:TimeZoneTypeSystem];

}
+ (NSString *)vk_convertTimeIntervalToTime:(NSString *)timeInterval
                                formatType:(DateFormatType)type
                                  timeZone:(TimeZoneType)timezoneType{
    //java timeInterval length -> 13
    if (timeInterval.length >10) {
        timeInterval = [timeInterval substringToIndex:10];
    }
    //转成 date 类型
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timeInterval integerValue]];
    NSDateFormatter *dateFormatter = [VKDateManager vk_standDateFormatterType:type
                                                                     timeZone:timezoneType];
    return [dateFormatter stringFromDate:date];
}


//标准时间->时间戳
+ (NSString *)vk_convertTimeToTimeInterval:(NSString *)time
                                formatType:(DateFormatType)type
                                  timeZone:(TimeZoneType)timezoneType{
    
    NSDateFormatter *dateFormatter = [VKDateManager vk_standDateFormatterType:type
                                                                     timeZone:timezoneType];
    NSDate *date = [dateFormatter dateFromString:time];
    NSTimeInterval dateTimeInterval = [date timeIntervalSince1970];
    NSString *timeInterval = [NSString stringWithFormat:@"%ld",(long)dateTimeInterval];

    return timeInterval;

}


//多久之前
/**
 *  @param timeInterval 时间戳
 */
+ (NSString *)vk_intervalSinceNow:(NSString *)timeInterval{

    //java timeInterval length -> 13
    if (timeInterval.length >10) {
        timeInterval = [timeInterval substringToIndex:10];
    }

    NSDate *nowDate = [NSDate date];
    NSTimeInterval nowTimeInterval = [nowDate timeIntervalSince1970];
    NSTimeInterval oldTimeInterval = timeInterval.longLongValue;
    NSTimeInterval intervalTime = nowTimeInterval - oldTimeInterval;
    

    if (intervalTime < 60 * 60) {
        
        if (intervalTime < 60) {
            return [NSString stringWithFormat:@"%d 分前",1];
        }
        else{
            return [NSString stringWithFormat:@"%d 分前",(int)(intervalTime / 60)];
        }
    }
    else if(intervalTime < 60 * 60 * 24){
        return [NSString stringWithFormat:@"%d 时前",(int)(intervalTime / (60 * 60))];

    }
    else if(intervalTime < 60 * 60 * 24 * 10){
        return [NSString stringWithFormat:@"%d 天前",(int)(intervalTime / (60 * 60 * 24))];

    }
    else{
        return [VKDateManager vk_convertTimeIntervalToTime:timeInterval formatType:DateFormatTypeYMD];
    }
}




#pragma mark private method

+ (NSString *)getDateFormatType:(DateFormatType)type{
    switch (type) {
        case DateFormatTypeHM:
            return @"HH:mm";
            break;
        case DateFormatTypeHMS:
            return @"HH:mm:ss";
            break;
        case DateFormatTypeYMD:
            return @"yyyy-MM-dd";
            break;
        case DateFormatTypeYMDHM:
            return @"yyyy-MM-dd HH:mm";
            break;
        case DateFormatTypeYMDHMS:
            return @"yyyy-MM-dd HH:mm:ss";
            break;
    }

}

+ (NSTimeZone *)getTimeZoneType:(TimeZoneType)type{
    switch (type) {
        case TimeZoneTypeSystem:
            return [NSTimeZone systemTimeZone];
            break;
        case TimeZoneTypeShanghai:
            return [NSTimeZone timeZoneWithName:@"UTC+08:00"];
            break;
        case TimeZoneTypeGMT:
            return [NSTimeZone timeZoneWithName:@"UTC+00:00"];
            break;
    }
    
}
@end
