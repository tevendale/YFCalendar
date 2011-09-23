//
//  NSDate-Categories.h
//  YFCalendar
//
//  Created by Stuart Tevendale on 20/09/2011.
//  Copyright 2011 Yellow Field Technologies Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate(dateWithoutTime)
/*!
 @method dateWithoutTime
 @abstract   Returns the date with the hours, minutes and seconds set to 0.
 */
- (NSDate *)dateWithoutTime;
@end


@interface NSDate(getDayOfWeek)
/*!
 @method getDayOfWeek
 @abstract   Returns the day of the week.
 */
- (NSInteger)getDayOfWeek;
@end


@interface NSDate(addDaysToDate)
/*!
 @method addDaysToDate
 @abstract   Adds a number of days to the date.
 */
- (NSDate *)addDaysToDate:(NSInteger)days;
@end


@interface NSDate(addMonthsToDate)
/*!
 @method addMonthsToDate
 @abstract   Adds a number of months to the date.
 */
- (NSDate *)addMonthsToDate:(NSInteger)months;
@end


@interface NSDate(getMonthOfYear)
/*!
 @method getMonthOfYear
 @abstract   Returns the month of the year.
 */
- (NSInteger)getMonthOfYear;
@end


@interface NSDate(getDay)
/*!
 @method getDay
 @abstract   Returns the day of the month.
 */
- (NSInteger)getDay;
@end


@interface NSDate(getMonthName)
/*!
 @method getMonthName
 @abstract   Returns the name of the month.
 */
- (NSString *)getMonthName;
@end


@interface NSDate(getYear)
/*!
 @method getYear
 @abstract   Returns the year of the date.
 */
- (NSInteger)getYear;
@end








