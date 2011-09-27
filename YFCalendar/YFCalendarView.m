//
//  YFCalendarView.m
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

@synthesize swipeDelegate;



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

#pragma mark -
#pragma mark Swipe Methods


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"In YFCalendarView touchesBegan");
    CGPoint pt;
    NSSet *allTouches = [event allTouches];
    if ([allTouches count] == 1) {
        UITouch *touch = [[allTouches allObjects] objectAtIndex:0];
        if ([touch tapCount] == 1) {
            pt = [touch locationInView:self];
            touchBeganX = pt.x;
            touchBeganY = pt.y;
        }
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"In YFCalendarView touchesMoved");
    CGPoint pt;
    NSSet *allTouches = [event allTouches];
    if ([allTouches count] == 1) {
        UITouch *touch = [[allTouches allObjects] objectAtIndex:0];
        if ([touch tapCount] == 1) {
            pt = [touch locationInView:self];
            touchMovedX = pt.x;
            touchMovedY = pt.y;
        }
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"In YFCalendarView touchesEnded");
    NSSet *allTouches = [event allTouches];
    if ([allTouches count] == 1) {
        int diffX = touchMovedX - touchBeganX;
        int diffY = touchMovedY - touchBeganY;
        if (diffY >= -20 && diffY <= 20) {
            if (diffX > 20) {
                //NSLog(@"swipe right");
                if (swipeDelegate) [swipeDelegate viewDidSwipeRight:self];
            } else if (diffX < -20) {
                //NSLog(@"swipe left");
                if (swipeDelegate) [swipeDelegate viewDidSwipeLeft:self];
            }
        }
    }
}

- (void)dealloc {
    if (swipeDelegate) [swipeDelegate release];
    [super dealloc];
}



@end
