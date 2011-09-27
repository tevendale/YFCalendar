//
//  YFCalendarDayCell.h
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
#import <QuartzCore/QuartzCore.h>
#import "YFCalendarView.h"

@class YFCalendarViewController;
@class YFCalendarDayCellTable;


@interface YFCalendarDayCell : UIView <UITableViewDataSource, UITableViewDelegate> {
	
	NSDate *date;
	//UIView *superView;
    IBOutlet YFCalendarDayCellTable *cellTableView;
    IBOutlet UILabel *dateField;
    YFCalendarViewController *controller;
	
}

@property (nonatomic, retain) NSDate *date;
@property (nonatomic, retain) IBOutlet UITableView *cellTableView;
@property (nonatomic, retain) IBOutlet UILabel *dateField;
@property (nonatomic, retain) YFCalendarViewController *controller;

- (void)clearSelection;

@end
