//
//  MNUser+CoreDataProperties.h
//  PhoneList
//
//  Created by iMac on 15.02.17.
//  Copyright © 2017 hata. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "MNUser.h"

NS_ASSUME_NONNULL_BEGIN

@interface MNUser (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *firstName;
@property (nullable, nonatomic, retain) NSString *lastName;
@property (nullable, nonatomic, retain) NSString *email;

@end

NS_ASSUME_NONNULL_END
