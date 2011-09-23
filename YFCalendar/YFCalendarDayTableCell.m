//
//  YFCalendarDayTableCell.m
//  YFCalendar
//
//  Created by Stuart Tevendale on 19/09/2011.
//  Copyright 2011 Yellow Field Technologies Ltd. All rights reserved.
//

#import "YFCalendarDayTableCell.h"

@implementation YFCalendarDayTableCell

@synthesize cellLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
