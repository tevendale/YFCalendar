//
//  NSDate-Categories.m
//  YFCalendar
//
//  Created by Stuart Tevendale on 20/09/2011.
//  Copyright 2011 Yellow Field Technologies Ltd. All rights reserved.
//

#import "NSDate-Categories.h"

@implementation NSDate (dateWithoutTime)

- (NSDate *)dateWithoutTime
{
	NSDateComponents *newComps = [[NSDateComponents alloc] init];
    
    NSInteger year, month, day;
    
    year = [self getYear];
    month = [self getMonthOfYear];
    day = [self getDay];
    
    [newComps setYear:year];
    [newComps setMonth:month];
    [newComps setDay:day];
    [newComps setHour:0];
    [newComps setMinute:0];
    [newComps setSecond:0];
    
    NSDate *dateWithoutTime = [[NSCalendar currentCalendar] dateFromComponents:newComps];
    
	return dateWithoutTime;
    
    [newComps release];
}

@end

@implementation NSDate (getDayOfWeek)

- (NSInteger)getDayOfWeek {
    NSDateComponents* comps = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSWeekCalendarUnit|NSWeekdayCalendarUnit fromDate:self]; // Get necessary date components
    
    return [comps weekday];
    
}

@end


@implementation NSDate (addDaysToDate)
- (NSDate *)addDaysToDate:(NSInteger)days {
    /*NSDateComponents* comps = [calendarView.currentCalendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSWeekCalendarUnit|NSWeekdayCalendarUnit|NSDayCalendarUnit fromDate:date]; // Get necessary date components
     
     NSInteger newDay = [comps day] + days;
     [comps setDay:newDay];
     
     return [calendarView.currentCalendar dateFromComponents:comps];*/
    
    NSDateComponents *components = [[[NSDateComponents alloc] init] autorelease];
    components.day = days;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:components toDate:self options:0];
    
    return newDate;
}

@end

@implementation NSDate (addMonthsToDate)
- (NSDate *)addMonthsToDate:(NSInteger)months {
    
    NSDateComponents *components = [[[NSDateComponents alloc] init] autorelease];
    components.month = months;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:components toDate:self options:0];
    
    return newDate;
}

@end


@implementation NSDate (getMonthOfYear)

- (NSInteger)getMonthOfYear {
    NSDateComponents* comps = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSWeekCalendarUnit|NSWeekdayCalendarUnit fromDate:self]; // Get necessary date components
    
    return [comps month];    
}
@end


@implementation NSDate (getYear)

- (NSInteger)getYear {
    NSDateComponents* comps = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSWeekCalendarUnit|NSWeekdayCalendarUnit fromDate:self]; // Get necessary date components
    
    return [comps year];
    
}
@end


@implementation NSDate (getDay)
- (NSInteger)getDay {
    NSDateComponents* comps = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSWeekCalendarUnit|NSWeekdayCalendarUnit|NSDayCalendarUnit fromDate:self]; // Get necessary date components
    
    return [comps day];
}
@end


@implementation NSDate (getMonthName)
- (NSString *)getMonthName {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMMM"];
    NSString *stringFromDate = [formatter stringFromDate:self];
    [formatter release];
    
    return stringFromDate;
    
}
@end

