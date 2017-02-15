//
//  MNUserTableViewController.h
//  PhoneList
//
//  Created by iMac on 15.02.17.
//  Copyright © 2017 hata. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MNUserTableViewController : UITableViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *firstName;
@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (weak, nonatomic) IBOutlet UITextField *email;

- (IBAction)actionAddUser:(UIButton *)sender;

@end
