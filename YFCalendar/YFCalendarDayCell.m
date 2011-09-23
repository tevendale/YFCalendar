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

#import "YFCalendarDayCell.h"
#import "YFCalendarDayTableCell.h"
#import "YFCalendarViewController.h"


@implementation YFCalendarDayCell

@synthesize date;
@synthesize cellTableView;
@synthesize dateField;
@synthesize controller;

- (id)init {
    //return [super init];
    
    self = (YFCalendarDayCell *)[[[NSBundle mainBundle] loadNibNamed:@"YFCalendarDayCell" owner:self options:nil] objectAtIndex:0];
    if (self) {
        // Custom setup
        cellTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
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
    // For UIView
    [thePath moveToPoint:CGPointMake(0,0)];
	[thePath addLineToPoint:CGPointMake(rect.size.width,0)];
    [thePath addLineToPoint:CGPointMake(rect.size.width,rect.size.height)];
    [thePath addLineToPoint:CGPointMake(0, rect.size.height)];
    
	[thePath closePath];
	[thePath setLineWidth:0.5];
	[thePath stroke];
}


#pragma  mark - UITableViewDataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *itemsArray = [controller.dataDictionary objectForKey:date];
	
	return [itemsArray count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellTableIdentifier = @"CellTableIdentifier";
    
    YFCalendarDayTableCell *cell = (YFCalendarDayTableCell *)[tableView dequeueReusableCellWithIdentifier:cellTableIdentifier];

    
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"YFCalendarDayTableCell" owner:self options:nil];
        
        for (id oneObject in nib) {
            if ([oneObject isKindOfClass:[YFCalendarDayTableCell class]]) {
                cell = (YFCalendarDayTableCell *)oneObject;
            }
        }
    }
    
    NSArray *itemsArray = [controller.dataDictionary objectForKey:date];
    NSUInteger row = [indexPath row];
	
	NSString *title = [[itemsArray objectAtIndex:row] objectForKey:@"Title"];
     
    cell.cellLabel.text = title;
    cell.cellLabel.backgroundColor = [UIColor clearColor];        
    // Set UILabel.layer.backgroundColor not UILabel.backgroundColor otherwise the background is not masked to the rounded border.
    cell.cellLabel.layer.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.5].CGColor;
    
    cell.cellLabel.layer.cornerRadius = 10;
    cell.cellLabel.layer.borderColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.5].CGColor;
    cell.cellLabel.layer.borderWidth = 1;
    // Huge change in performance by explicitly setting the below (even though default is supposedly NO)
    cell.cellLabel.layer.masksToBounds = NO;
    // Performance improvement here depends on the size of your view
    cell.cellLabel.layer.shouldRasterize = YES;
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 24;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [controller deselectAllExceptForDate:date];
    [controller selectionDidChange:self];
}

- (void)clearSelection {
    NSIndexPath *selected = [cellTableView indexPathForSelectedRow];
    
    if (selected != Nil) {
        [cellTableView deselectRowAtIndexPath:selected animated:NO];
    }
}

@end
