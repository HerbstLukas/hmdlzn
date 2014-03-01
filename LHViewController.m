//
//  LHViewController.m
//  hmdlzn
//
//  Created by Lukas Herbst on 25.02.14.
//  Copyright (c) 2014 Lukas Herbst. All rights reserved.
//

#import "LHViewController.h"
#import "NZAlertView.h"
#import "NSDate-Utilities.h"

@interface LHViewController ()

@end

@implementation LHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Set Title
    self.title = @"Hemadlenzn <3";
    
    if (![@"1" isEqualToString:[[NSUserDefaults standardUserDefaults]objectForKey:@"seved"]])
    {
        
        UIAlertView *firstStart = [[UIAlertView alloc] initWithTitle:@"Hä?"
                                                             message:@"Du woast no ned wann'st zum Weißwurschtfrühstücken ofangst?"
                                                            delegate:nil
                                                   cancelButtonTitle:@"I drogs glei ei!"
                                                   otherButtonTitles:nil];
        [firstStart show];
    }
    else
    {
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        self.dateFromPicker = [prefs objectForKey:@"savedTime"];
        
        [self zeitSpanneBerechnen];
        [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(zeitSpanneBerechnen) userInfo:nil repeats:YES];
    }
}

- (void)zeitSpanneBerechnen
{
    NSDateComponents *zeitSpanne = [[NSCalendar currentCalendar] components:NSYearCalendarUnit | NSMonthCalendarUnit | NSWeekCalendarUnit | NSHourCalendarUnit | NSDayCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit
                                                                   fromDate:[NSDate date]
                                                                     toDate:self.dateFromPicker
                                                                    options:0];
    
    NSDate *today = [NSDate date];
    
    if([self.dateFromPicker isEarlierThanDate:today])
    {
        self.nochLabel.text = @"JUHUU";
        self.bisLabel.text = @"";
        self.timeToHmdlznLabel.text = @"ES IST SOWEIT!!!";
    } else
    {
        self.timeToHmdlznLabel.text = [NSString stringWithFormat:@"%li Monate - %li Tage - %li Stunden - %li Minuten - %li Sekunden",(long)zeitSpanne.month,(long)zeitSpanne.day,(long)zeitSpanne.hour, (long)zeitSpanne.minute, (long)zeitSpanne.second];
        
        self.nochLabel.text = @"noch";
        self.bisLabel.text = @"bis";
    }

}

- (IBAction)saveTime:(id)sender
{
    //Hole Datum von Picker
    NSDateFormatter *DateFormat = [[NSDateFormatter alloc] init];
    [DateFormat setDateFormat:@"dd/MM/yyy - HH/mm"];
    self.dateFromPicker = [self.dateTimePicker date];
    
    //SaveToNSUserDefaults
    [[NSUserDefaults standardUserDefaults] setValue:self.dateFromPicker forKey:@"savedTime"];
    [[NSUserDefaults standardUserDefaults] setValue:@"1" forKey:@"seved"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    //NZAlertView - TimeSet
    NZAlertView *saveSucces = [[NZAlertView alloc] initWithStyle:NZAlertStyleSuccess
                                                           title:@"YEAH!"
                                                         message:@"Is gspeichert! Fui Spaß :)"
                                                        delegate:nil];
    
    [saveSucces setTextAlignment:NSTextAlignmentLeft];
    [saveSucces show];
    
    //Run zeitSpanneBerechnen
    [self zeitSpanneBerechnen];
}

- (IBAction)shareTimeButton:(id)sender
{
    NSString *noch = @"noch";
    NSString *bis = @"bis HEMADLENZN 2015!";
    NSArray *itemToShare = [NSArray arrayWithObjects:noch, self.timeToHmdlznLabel.text, bis, nil];
    UIActivityViewController *controller = [[UIActivityViewController alloc] initWithActivityItems:itemToShare applicationActivities:nil];
    [self presentViewController:controller animated:YES completion:nil];
}
@end