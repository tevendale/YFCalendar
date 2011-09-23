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

#import "YFCalendarView.h"
#import "YFCalendarDayCell.h"
#import "YFCalendarViewController.h"

#define kMonthlyView 1
#define kWeeklyView 2


@implementation YFCalendarView

@synthesize currentCalendar;
@synthesize currentMonthField;
@synthesize leftButton;
@synthesize rightButton;
@synthesize todayButton;

@synthesize sundayField;
@synthesize mondayField;
@synthesize tuesdayField;
@synthesize wednesdayField;
@synthesize thursdayField;
@synthesize fridayField;
@synthesize saturdayField;

@synthesize calendarCellsDictionary;
//@synthesize dataDictionary;

@synthesize selectedDate;
@synthesize selectedTitle;
@synthesize selectedObject;

@synthesize focusDate;



#pragma mark -
#pragma mark Setup

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
		
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
	rect = [self bounds];
	
	[[UIColor whiteColor] set];
	
	// Line Under Month
	[[UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:1] set];
	UIBezierPath* thePath = [UIBezierPath bezierPath];
	int offset = 30;
    
    // For UIView
    [thePath moveToPoint:CGPointMake(0,offset)];
	[thePath addLineToPoint:CGPointMake(rect.size.width,offset)];

	[thePath closePath];
	[thePath setLineWidth:0.5];
	[thePath stroke];
}


- (BOOL)acceptsFirstResponder {
    return YES; 
}



@end
