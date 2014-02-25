//
//  LHDevViewController.m
//  hmdlzn
//
//  Created by Lukas Herbst on 25.02.14.
//  Copyright (c) 2014 Lukas Herbst. All rights reserved.
//

#import "LHDevViewController.h"

@interface LHDevViewController ()

@end

@implementation LHDevViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Developer";

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
