//
//  UITableViewController+CoreData.m
//  PhoneList
//
//  Created by iMac on 15.02.17.
//  Copyright © 2017 hata. All rights reserved.
//

#import "UITableViewController+CoreData.h"

@implementation UITableViewController (CoreData)

- (NSManagedObjectContext*) getManagedObjectContext {
    
    NSManagedObjectContext* context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

@end
