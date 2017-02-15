//
//  MNPhoneListTableViewController.m
//  PhoneList
//
//  Created by iMac on 15.02.17.
//  Copyright © 2017 hata. All rights reserved.
//

#import "MNPhoneListTableViewController.h"
#import "UITableViewController+CoreData.h"
#import "MNUserTableViewController.h"
#import <CoreData/CoreData.h>
#import "MNUserInfoCell.h"
#import "MNUser.h"

@interface MNPhoneListTableViewController ()

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) NSArray <MNUser*> * users;

@end

@implementation MNPhoneListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIBarButtonItem* addUser = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                             target:self
                                                                             action:@selector(actionAddUser:)];
    
    UIBarButtonItem* removeAllUsers = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash
                                                                                   target:self
                                                                                   action:@selector(actionRemoveAllUsers:)];
    
    [self.navigationItem setRightBarButtonItem:addUser];
    [self.navigationItem setLeftBarButtonItem:removeAllUsers];
    
    self.managedObjectContext = [self getManagedObjectContext];
    self.users = [self getAllObjects];

}

- (void)viewWillAppear:(BOOL)animated {
    
    [self reloadTableView];
    
}


#pragma mark - Support methods

- (NSArray*) getAllObjects {
    
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    
    NSEntityDescription* description = [NSEntityDescription entityForName:@"MNUser" inManagedObjectContext:self.managedObjectContext];
    
    [request setEntity:description];
    
    NSError* requestError = nil;
    
    NSArray* resultArray = [self.managedObjectContext executeFetchRequest:request error:&requestError];
    
    if (requestError) {
        NSLog(@"%@", [requestError localizedDescription]);
    }
    
    return resultArray;
    
}

- (void) deleteAllObjects {
    
    NSArray* allObjects = [self getAllObjects];
    
    for (id object in allObjects) {
        
        [self.managedObjectContext deleteObject:object];
    }
    
    [self.managedObjectContext save:nil];
}


- (void) actionAddUser:(UIBarButtonItem*) sender {
    
    MNUserTableViewController* userViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MNUserTableViewController"];
    
    [self.navigationController pushViewController:userViewController animated:YES];
    
}

- (void) actionRemoveAllUsers:(UIBarButtonItem*) sender {
    
    [self deleteAllObjects];
    
    [self reloadTableView];
    
    
}

- (void) reloadTableView {
    
    self.users = [self getAllObjects];
    [self.tableView reloadData];
    
}


#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.users count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* identifier = @"User";
    
    MNUserInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    if (!cell) {
        //cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
        cell = [[MNUserInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    MNUser* user = self.users[indexPath.row];
    
    //cell.textLabel.text = user.firstName;
    //cell.detailTextLabel.text = user.lastName;
    
    cell.firstName.text = user.firstName;
    cell.lastName.text = user.lastName;
    cell.email.text = user.email;
    
    
    return cell;
}




@end
