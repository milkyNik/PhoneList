//
//  UITableViewController+CoreData.h
//  PhoneList
//
//  Created by iMac on 15.02.17.
//  Copyright © 2017 hata. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewController (CoreData)

- (NSManagedObjectContext*) getManagedObjectContext;

@end
