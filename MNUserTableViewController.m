//
//  MNUserTableViewController.m
//  PhoneList
//
//  Created by iMac on 15.02.17.
//  Copyright © 2017 hata. All rights reserved.
//

#import "MNUserTableViewController.h"

@interface MNUserTableViewController ()

@end

@implementation MNUserTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if ([textField isEqual:self.firstName]) {
    
        [self.lastName becomeFirstResponder];
        
    } else if ([textField isEqual:self.lastName]) {
        
        [self.email becomeFirstResponder];
        
    } else {
        
        [textField resignFirstResponder];
        
    }
    return YES;
}



@end
