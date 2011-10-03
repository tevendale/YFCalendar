//
//  YFCalendarViewController.m
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


#import "YFCalendarViewController.h"
#import "YFCalendarView.h"
#import "YFCalendarDayCell.h"
#import "NSDate-Categories.h"

@implementation YFCalendarViewController

@synthesize calendarView;
@synthesize dataDictionary;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    
    // get the current Calendar type
    calendarView.currentCalendar = [NSCalendar currentCalendar];
    calendarView.swipeDelegate = self;
    
    calendarView.focusDate = [[NSDate date] dateWithoutTime];
    
    NSLog(@"focus date = %@", calendarView.focusDate);
    
    dataDictionary = [[NSMutableDictionary alloc] init];
    
    // Draw Month Year Title and Buttons
	calendarView.currentMonthField = [[UITextField alloc] init];
	[calendarView addSubview:calendarView.currentMonthField];
	
	calendarView.leftButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[calendarView.leftButton setTitle:@"<" forState:UIControlStateNormal];
    [calendarView.leftButton addTarget:self action:@selector(changeDateIncrementally:) forControlEvents:UIControlEventTouchUpInside];
    
	[calendarView addSubview:calendarView.leftButton];
	
	calendarView.rightButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [calendarView.rightButton setTitle:@">" forState:UIControlStateNormal];
    [calendarView.rightButton addTarget:self action:@selector(changeDateIncrementally:) forControlEvents:UIControlEventTouchUpInside];

	[calendarView addSubview:calendarView.rightButton];
	
	calendarView.todayButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [calendarView.todayButton setTitle:@"Today" forState:UIControlStateNormal];
    [calendarView.todayButton addTarget:self action:@selector(changeDateIncrementally:) forControlEvents:UIControlEventTouchUpInside];

	[calendarView addSubview:calendarView.todayButton];
	
	//  Draw Day Titles
	calendarView.sundayField = [[UITextField alloc] init];
	calendarView.mondayField = [[UITextField alloc] init];
	calendarView.tuesdayField = [[UITextField alloc] init];
	calendarView.wednesdayField = [[UITextField alloc] init];
	calendarView.thursdayField = [[UITextField alloc] init];
	calendarView.fridayField = [[UITextField alloc] init];
	calendarView.saturdayField = [[UITextField alloc] init];
	
	calendarView.sundayField.text = @"Sunday";
	calendarView.mondayField.text = @"Monday";
	calendarView.tuesdayField.text = @"Tuesday";
	calendarView.wednesdayField.text = @"Wednesday";
	calendarView.thursdayField.text = @"Thursday";
	calendarView.fridayField.text = @"Friday";
	calendarView.saturdayField.text = @"Saturday";
	
	NSMutableArray *daysArray = [[NSMutableArray alloc] init];
	[daysArray addObject:calendarView.sundayField];
	[daysArray addObject:calendarView.mondayField];
	[daysArray addObject:calendarView.tuesdayField];
	[daysArray addObject:calendarView.wednesdayField];
	[daysArray addObject:calendarView.thursdayField];
	[daysArray addObject:calendarView.fridayField];
	[daysArray addObject:calendarView.saturdayField];
	
	id object;
	NSEnumerator *daysEnumerator = [daysArray objectEnumerator];
	while( object = [daysEnumerator nextObject] ) {
		
		[calendarView addSubview:object];
		
	}
	
	// Draw Calendar Cells
	calendarView.calendarCellsDictionary = [[NSMutableDictionary alloc] init];
	
	int i, j, k=0;
	for( i=0; i<6; i++ ) {
		for( j=0; j<7; j++ ) {
			
			
			YFCalendarDayCell *tableView = [[YFCalendarDayCell alloc] init];
            tableView.cellTableView.dataSource = tableView;
            tableView.cellTableView.delegate = tableView;
            tableView.controller = self;
       			
			[calendarView addSubview:tableView];
			
			[calendarView.calendarCellsDictionary setObject:tableView forKey:[[NSNumber numberWithInt:k++] stringValue]];
		}
	}
	
	[self drawCalendar];
    
    [self addExampleEvents];
    
    [super viewDidLoad];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

- (void)addObject:(id)object
		withTitle:(NSString *)title
   atCalendarDate:(NSDate *)date
{
	date = [date dateWithoutTime];
	
	// Create New Entry
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setObject:date forKey:@"Date"];
	[dictionary setObject:title forKey:@"Title"];
	
	if( object )
		[dictionary setObject:object forKey:@"Object"];
	
	// Find Original Entry for the Date
	NSMutableArray *originalArray = [[NSMutableArray alloc] initWithArray:[dataDictionary objectForKey:date]];
	[originalArray addObject:dictionary];
	[dataDictionary setObject:originalArray forKey:[date dateWithoutTime]];
	
	[self drawCalendar];
}


#pragma mark -
#pragma mark Selection

- (void)selectObject:(id)object
			withDate:(NSDate *)date
{
	date = [date dateWithoutTime];
	
	[self deselectAllExceptForDate:date];
	[self setFocusDate:date];
	
	NSArray *dateArray = [dataDictionary objectForKey:date];
	int i, selectedIndex = -1;
	
	for( i=0; i<[dateArray count]; i++ ) {
		
		if( [[dateArray objectAtIndex:i] objectForKey:@"Object"] == object )
			selectedIndex = i;
	}
}


- (void)deselectAllExceptForDate:(NSDate *)date {
	int i;
     for( i=0; i<[calendarView.calendarCellsDictionary count]; i++ ) {
         if( [[calendarView.calendarCellsDictionary objectForKey:[[NSNumber numberWithInt:i] stringValue]] date] != date) {
             YFCalendarDayCell *cell = (YFCalendarDayCell *)[calendarView.calendarCellsDictionary objectForKey:[[NSNumber numberWithInt:i] stringValue]];
             [cell clearSelection];
         }
     }
}

- (void)deselectAll {
	int i;
    for( i=0; i<[calendarView.calendarCellsDictionary count]; i++ ) {
        YFCalendarDayCell *cell = (YFCalendarDayCell *)[calendarView.calendarCellsDictionary objectForKey:[[NSNumber numberWithInt:i] stringValue]];
        [cell clearSelection];
    }
}

- (void)removeAllObjects {
	[dataDictionary removeAllObjects];
	[self drawCalendar];
}


- (void)drawCalendar
{
	CGRect rect = [calendarView bounds];
	
	// Hide all DayCells
    id object;
	NSEnumerator *tableViewsEnumerator = [calendarView.calendarCellsDictionary objectEnumerator];
	while( object = [tableViewsEnumerator nextObject] ) {
		[object setHidden:YES];
	}
	
	
	NSDate *firstDate;
	NSDate *lastDate;
    
    NSDateComponents* comps = [calendarView.currentCalendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSWeekCalendarUnit|NSWeekdayCalendarUnit fromDate:calendarView.focusDate]; // Get necessary date components
    
    // Get first date of month
    [comps setDay:1];
    firstDate = [calendarView.currentCalendar dateFromComponents:comps];
    
    // set last of month
    [comps setMonth:[comps month]+1];
    [comps setDay:0];
    lastDate = [calendarView.currentCalendar dateFromComponents:comps];
    
    
    while( 1 != [firstDate getDayOfWeek] ) {
        firstDate = [firstDate addDaysToDate:-1];
    }
    
	
	// Get Number of Week Rows
	int weekRowCount = 0;
		
    NSDate *weekRowDate = [[NSDate alloc] initWithString:[firstDate description]];
    
    while( 1 < [weekRowDate getDayOfWeek] )
        weekRowDate = [weekRowDate addDaysToDate:-1];
    
    do {
        weekRowDate = [weekRowDate addDaysToDate:7];
        weekRowCount++;
    } while ( [weekRowDate getMonthOfYear] == [calendarView.focusDate getMonthOfYear] );
		
	
	// Create Number of days in the  week
	int numberOfDaysInTheWeek = 7;
	
	// Create Cell Sizes
	float cellWidth = rect.size.width / numberOfDaysInTheWeek;
	float cellHeight = (rect.size.height-51) / weekRowCount;
	
	// Create Offset
	int numberOfDaysOffset = 0;
	
	// Draw Month Title
    calendarView.currentMonthField.text = [NSString stringWithFormat:@"%@ %d", [calendarView.focusDate getMonthName], [calendarView.focusDate getYear]];
    calendarView.currentMonthField.frame = CGRectMake( rect.size.width/2 - 200, 9, 400, 25 );
	calendarView.leftButton.frame = CGRectMake( rect.size.width-104, 5, 25, 20 );
    calendarView.rightButton.frame = CGRectMake( rect.size.width-81, 5, 25, 20 );
	calendarView.todayButton.frame = CGRectMake( rect.size.width-53, 5, 50, 20 );

	
	// Locate Day Titles
    [calendarView.sundayField setFrame:CGRectMake(0 - numberOfDaysOffset, 31, cellWidth+1, 20 )];
	[calendarView.mondayField setFrame:CGRectMake( cellWidth - numberOfDaysOffset, 31, cellWidth+1, 20 )];
	[calendarView.tuesdayField setFrame:CGRectMake( 2*cellWidth - numberOfDaysOffset, 31, cellWidth+1, 20 )];
	[calendarView.wednesdayField setFrame:CGRectMake( 3*cellWidth - numberOfDaysOffset, 31, cellWidth+1, 20 )];
	[calendarView.thursdayField setFrame:CGRectMake( 4*cellWidth - numberOfDaysOffset, 31, cellWidth+1, 20 )];
	[calendarView.fridayField setFrame:CGRectMake( 5*cellWidth - numberOfDaysOffset, 31, cellWidth+1, 20 )];
	[calendarView.saturdayField setFrame:CGRectMake( 6*cellWidth - numberOfDaysOffset, 31, cellWidth+1, 20 )];
	
	// Locate Fields
	NSDate *currentDate = [firstDate copy];
	
	int i, j, k=0;
	//for( i=weekRowCount; i>0; i-- ) {
    for( i=1; i<=weekRowCount; i++ ) {
		for( j=0; j<7; j++ ) {
			
			YFCalendarDayCell *currentCell = (YFCalendarDayCell *)[calendarView.calendarCellsDictionary objectForKey:[[NSNumber numberWithInt:k++] stringValue]];
             
			NSDate *calendarDate = [currentDate dateWithoutTime];
			
			CGRect rect;
            if( weekRowCount == 1 ) {
				rect = CGRectMake( j*cellWidth - numberOfDaysOffset, (i-1)*cellHeight + 51, cellWidth+1, cellHeight+1 );
            }
			if( weekRowCount == 4 ) {
				rect = CGRectMake( j*cellWidth - numberOfDaysOffset, (i-2)*cellHeight + 51, cellWidth+1, cellHeight+1 );
            }
			else if( weekRowCount == 5 ) {
				rect = CGRectMake( j*cellWidth - numberOfDaysOffset, (i-1)*cellHeight + 51, cellWidth+1, cellHeight+1 );
            }
			else if( weekRowCount == 6 ) {
				rect = CGRectMake( j*cellWidth - numberOfDaysOffset, (i-1)*cellHeight + 51, cellWidth+1, cellHeight+1 );
            }

			
			currentCell.frame = rect;
			[currentCell setHidden:NO];
			
			currentCell.date = calendarDate;
			[currentCell.cellTableView reloadData];
            currentCell.dateField.text = [NSString stringWithFormat:@"%d", [calendarDate getDay]];
			
			currentDate = [currentDate addDaysToDate:1];
		}
	}
	
	[self colorCells];
}

- (void)resizeSubviewsWithOldSize:(CGSize)oldBoundsSize
{
	[self drawCalendar];
}


- (void)colorCells
{
	
	YFCalendarDayCell *object;
	NSEnumerator *tableViewsEnumerator = [calendarView.calendarCellsDictionary objectEnumerator];
	while(object = (YFCalendarDayCell *)[tableViewsEnumerator nextObject]) {
		
		NSDate *calendarDate = [object date];
        
		
		// Dim Dates from Other Months, if we're in Monthly View
		if( [[calendarDate dateWithoutTime] getMonthOfYear] != [calendarView.focusDate getMonthOfYear]) {
			object.cellTableView.backgroundColor = [UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:1.0];
        }
		
		// Color Today
		else if([[calendarDate dateWithoutTime] isEqualToDate:[[NSDate date] dateWithoutTime]]) {
			object.cellTableView.backgroundColor = [UIColor colorWithRed:0.92 green:0.95 blue:0.98 alpha:0.9];
        }
		
		// Color Focus Date
		else if([[calendarDate dateWithoutTime] isEqualToDate:[calendarView.focusDate dateWithoutTime]]) {
			object.cellTableView.backgroundColor = [UIColor colorWithRed:0.92 green:0.95 blue:0.98 alpha:1.0];
        }
		
		else {
			object.cellTableView.backgroundColor = [UIColor whiteColor];
        }
	}
}


#pragma mark -
#pragma mark Selection Did Change

- (void)selectionDidChange:(YFCalendarDayCell *)cell {
    NSArray *itemsArray = [dataDictionary objectForKey:cell.date];
    NSIndexPath *selected = [cell.cellTableView indexPathForSelectedRow];
    NSUInteger row = [selected row];
	
	NSString *title = [[itemsArray objectAtIndex:row] objectForKey:@"Title"];
	
    NSLog(@"Selected Item: %@", title);
}



#pragma mark -
#pragma mark Data

- (IBAction)changeDateIncrementally:(id)sender
{
	[self deselectAll];
	
	NSString *title = [sender currentTitle];
	
	NSDate *newDate = [[NSDate alloc] init];
		
    if( [title isEqualToString:@"<"] )
        newDate = [calendarView.focusDate addMonthsToDate:-1];
    else if( [title isEqualToString:@">"] )
        newDate = [calendarView.focusDate addMonthsToDate:1];
		
	
	
	if( [title isEqualToString:@"today"] )
		newDate = [NSDate date];
	
	calendarView.focusDate = [[NSDate alloc] initWithString:[newDate description]];
    [self drawCalendar];
}

- (void)showNextMonth {
	[self deselectAll];
    
    NSDate *newDate = [calendarView.focusDate addMonthsToDate:1];
	
	calendarView.focusDate = [newDate copy];
    
	[self drawCalendar];
}

- (void)showPreviousMonth {
	[self deselectAll];
    
    NSDate *newDate = [calendarView.focusDate addMonthsToDate:-1];
	
	calendarView.focusDate = [newDate copy];
    
	[self drawCalendar];
}


- (void)setFocusDate:(NSDate*)date {
	
	calendarView.focusDate = [date copy];
	[self colorCells];
}

- (NSDate *)focusDate { 
    return calendarView.focusDate;
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    [self drawCalendar];
}

- (void)addExampleEvents {
	[self addObject:[NSNumber numberWithInt:1]
				  withTitle:@"Yesterday"
			 atCalendarDate:[[NSDate date] addDaysToDate:-1]];
	
	[self addObject:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:2] forKey:@"Number"]
				  withTitle:@"Today"
			 atCalendarDate:[NSDate date]];
	
	[self addObject:[NSArray arrayWithObjects:[NSNumber numberWithInt:3], [NSNumber numberWithInt:4], [NSNumber numberWithInt:5], nil]
				  withTitle:@"Today 2"
			 atCalendarDate:[NSDate date]];
	
	[self addObject:nil
				  withTitle:@"Tomorrow"
			 atCalendarDate:[[NSDate date] addDaysToDate:1]];
    
    [self drawCalendar];
}


#pragma mark -
#pragma mark Swipe Delegate Methods

- (void)viewDidSwipeLeft:(YFCalendarView *)swipeView {
    NSLog(@"swipe left");
}

- (void)viewDidSwipeRight:(YFCalendarView *)swipeView {
    NSLog(@"swipe right");
}


@end
