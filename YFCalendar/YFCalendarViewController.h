//
//  YFCalendarViewController.h
//  YFCalendar
//
//  Created by Stuart Tevendale on 15/09/2011.
//  Copyright 2011 Yellow Field Technologies Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YFCalendarView;
@class YFCalendarDayCell;

@interface YFCalendarViewController : UIViewController  {
    IBOutlet YFCalendarView *calendarView;
    NSMutableDictionary *dataDictionary;
    
}

@property (nonatomic, retain) NSMutableDictionary *dataDictionary;
@property (nonatomic, retain) IBOutlet YFCalendarView *calendarView;
- (void)addObject:(id)object
		withTitle:(NSString *)title
   atCalendarDate:(NSDate *)date;

- (void)selectObject:(id)object
			withDate:(NSDate *)date;
- (void)deselectAllExceptForDate:(NSDate *)date;
- (void)deselectAll;
- (void)removeAllObjects;

- (void)drawCalendar;
- (void)resizeSubviewsWithOldSize:(CGSize)oldBoundsSize;
- (void)colorCells;

- (void)selectionDidChange:(YFCalendarDayCell *)cell;

- (IBAction)changeDateIncrementally:(id)sender;
- (void)setFocusDate:(NSDate*)date;
- (NSDate *)focusDate;

- (void)addExampleEvents;



@end
