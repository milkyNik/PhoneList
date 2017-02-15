//
//  MNUserTableViewController.m
//  PhoneList
//
//  Created by iMac on 15.02.17.
//  Copyright © 2017 hata. All rights reserved.
//

#import "MNUserTableViewController.h"
#import "UITableViewController+CoreData.h"
#import "MNUser.h"

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

#pragma mark - Actions

- (IBAction)actionAddUser:(UIButton *)sender {
    
    MNUser* newUser = [NSEntityDescription insertNewObjectForEntityForName:@"MNUser" inManagedObjectContext:[self getManagedObjectContext]];
    
    newUser.firstName = self.firstName.text;
    newUser.lastName = self.lastName.text;
    newUser.email = self.email.text;
    
    [newUser.managedObjectContext save:nil];
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Success" message:@"User created" preferredStyle:UIAlertControllerStyleAlert];
    
    [self presentViewController:alert animated:YES completion:^{
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [self dismissViewControllerAnimated:YES completion:nil];
            
        });
        
    }];
    
}
@end
