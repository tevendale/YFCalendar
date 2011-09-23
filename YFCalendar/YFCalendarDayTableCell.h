//
//  YFCalendarDayTableCell.h
//  YFCalendar
//
//  Created by Stuart Tevendale on 19/09/2011.
//  Copyright 2011 Yellow Field Technologies Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YFCalendarDayTableCell : UITableViewCell {
    IBOutlet UILabel *cellLabel;
}

@property (nonatomic, retain) IBOutlet UILabel *cellLabel;

@end
