//
//  LHViewController.h
//  hmdlzn
//
//  Created by Lukas Herbst on 25.02.14.
//  Copyright (c) 2014 Lukas Herbst. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LHViewController : UIViewController

//Button Actions
- (IBAction)saveTime:(id)sender;
- (IBAction)shareTimeButton:(id)sender;


//IBOutlets DatePicker and Label
@property (strong, nonatomic) IBOutlet UILabel *timeToHmdlznLabel;
@property (strong, nonatomic) IBOutlet UIDatePicker *dateTimePicker;
@property (strong, nonatomic) IBOutlet UILabel *nochLabel;
@property (strong, nonatomic) IBOutlet UILabel *bisLabel;

//Propertys for .m 
@property (strong, nonatomic) NSDate *dateFromPicker;
@end
