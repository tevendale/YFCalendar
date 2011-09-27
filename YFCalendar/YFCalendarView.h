//
//  YFCalendarView.h
//  YFCalendar
//
//  Created by Stuart Tevendale on 15/09/2011.
//  Copyright 2011 Yellow Field Technologies Ltd. All rights reserved.
//

// Loosely based on LRCalendar, Copyright (c) 2006 by Logan Design, http://www.burgundylogan.com/

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
// THE COPYRIGHT HOLDER BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
// WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
// OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

#import <UIKit/UIKit.h>

@protocol SwipeViewDelegate;

@interface YFCalendarView : UIView {
	
    id <SwipeViewDelegate> swipeDelegate;
    int touchBeganX, touchBeganY;
    int touchMovedX, touchMovedY;
    
    NSDate *focusDate;
	NSString *focusDateDescription;
    
    NSCalendar *currentCalendar;
	
	NSMutableDictionary *calendarCellsDictionary;
	
	
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

@property (nonatomic, retain) id swipeDelegate;



#pragma mark -
#pragma mark Setup

- (id)initWithFrame:(CGRect)frame;
- (void)drawRect:(CGRect)rect;
- (BOOL)acceptsFirstResponder;


@end

@protocol SwipeViewDelegate <NSObject>
- (void)viewDidSwipeLeft:(YFCalendarView *)swipeView;
- (void)viewDidSwipeRight:(YFCalendarView *)swipeView;
@end

