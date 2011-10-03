//
//  YFCalendarViewController.h
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
#import "YFCalendarView.h"

@class YFCalendarDayCell;

@interface YFCalendarViewController : UIViewController <SwipeViewDelegate>  {
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
- (IBAction)showNextMonth:(id)sender;
- (IBAction)showPreviousMonth:(id)sender;
- (void)setFocusDate:(NSDate*)date;
- (NSDate *)focusDate;

- (void)addExampleEvents;


@end
