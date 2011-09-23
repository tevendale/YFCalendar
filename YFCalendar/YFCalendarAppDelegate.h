//
//  YFCalendarAppDelegate.h
//  YFCalendar
//
//  Created by Stuart Tevendale on 11/09/2011.
//  Copyright 2011 Yellow Field Technologies Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YFViewController;
@class YFCalendarViewController;

@interface YFCalendarAppDelegate : NSObject <UIApplicationDelegate> {
    
    
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet YFCalendarViewController *viewController;

@end
