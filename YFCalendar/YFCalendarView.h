/*
 Copyright (c) 2006 by Logan Design, http://www.burgundylogan.com/
 
 Permission is hereby granted, free of charge, to any person obtaining a
 copy of this software and associated documentation files (the "Software"),
 to deal in the Software without restriction, including without limitation
 the rights to use, copy, modify, merge, publish, distribute, sublicense,
 and/or sell copies of the Software, and to permit persons to whom the
 Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
 THE COPYRIGHT HOLDER BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
 OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 */

#import <UIKit/UIKit.h>


@interface YFCalendarView : UIView {
	
	NSDate *focusDate;
	NSString *focusDateDescription;
    
    NSCalendar *currentCalendar;
	
	NSMutableDictionary *calendarCellsDictionary;
	
/*	// Selection Did Change
	SEL selectionDidChangeSelector;
	id selectionDidChangeSender;
	
	// Event Did Move
	SEL eventDidMoveSelector;
	id eventDidMoveSender;
	
	// Will Display Cell
	id willDisplayCellSender;
	
	// Selected Item
	NSString *selectedTitle;
	NSDate *selectedDate;
	id selectedObject;
	
	// Hide Weekends
	int _hideWeekends;
	
	// Current View
	int _currentView;*/
	
	// Header
	UIButton *leftButton;
	UIButton *rightButton;
	UIButton *todayButton;
	UITextField *currentMonthField;
	
	// Week Days
	UITextField *sundayField;
	UITextField *mondayField;
	UITextField *tuesdayField;
	UITextField *wednesdayField;
	UITextField *thursdayField;
	UITextField *fridayField;
	UITextField *saturdayField;
	
}

@property (nonatomic, retain) NSCalendar *currentCalendar;
@property (nonatomic, retain) NSDate *focusDate;
@property (nonatomic, retain) UIButton *leftButton;
@property (nonatomic, retain) UIButton *rightButton;
@property (nonatomic, retain) UIButton *todayButton;
@property (nonatomic, retain) UITextField *currentMonthField;

// Week Days
@property (nonatomic, retain) UITextField *sundayField;
@property (nonatomic, retain) UITextField *mondayField;
@property (nonatomic, retain) UITextField *tuesdayField;
@property (nonatomic, retain) UITextField *wednesdayField;
@property (nonatomic, retain) UITextField *thursdayField;
@property (nonatomic, retain) UITextField *fridayField;
@property (nonatomic, retain) UITextField *saturdayField;

@property (nonatomic, retain) NSMutableDictionary *calendarCellsDictionary;

@property (nonatomic, retain) NSString *selectedTitle;
@property (nonatomic, retain) NSDate *selectedDate;
@property (nonatomic, retain) id selectedObject;


#pragma mark -
#pragma mark Setup

- (id)initWithFrame:(CGRect)frame;
- (void)drawRect:(CGRect)rect;
- (BOOL)acceptsFirstResponder;


@end
