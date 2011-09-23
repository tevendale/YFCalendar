//
//  YFCalendarViewController.m
//  YFCalendar
//
//  Created by Stuart Tevendale on 11/09/2011.
//  Copyright 2011 Yellow Field Technologies Ltd. All rights reserved.
//

#import "YFViewController.h"
#import "YFCalendarView.h"

@implementation YFViewController

//@synthesize calendarView;

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

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

- (IBAction)addExampleEvents:(id)sender
{
	/*NSDate *today = [NSDate date];
    
    [calendarView addObject:[NSNumber numberWithInt:1]
				  withTitle:@"Today!"
			 atCalendarDate:[NSDate date]];*/
	
	/*[calendarView addObject:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:2] forKey:@"Number"]
     withTitle:@"Today! Today! Today! Today! Today! Today! Today! Today! Today!"
     atCalendarDate:[NSCalendarDate dateWithNaturalLanguageString:@"today"]];
     
     [calendarView addObject:[NSArray arrayWithObjects:[NSNumber numberWithInt:3], [NSNumber numberWithInt:4], [NSNumber numberWithInt:5], nil]
     withTitle:@"Today 2!"
     atCalendarDate:[NSCalendarDate dateWithNaturalLanguageString:@"today"]];
     
     [calendarView addObject:nil
     withTitle:@"Tomorrow!"
     atCalendarDate:[NSCalendarDate dateWithNaturalLanguageString:@"tomorrow"]];*/
}


@end
