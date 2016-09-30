//
//  CustomTableViewController.h
//  ReceiptsApp
//
//  Created by Cay Cornelius on 29/09/16.
//  Copyright © 2016 Cornelius.Media. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddReceiptViewController.h"

@interface CustomTableViewController : UITableViewController <AddReceiptViewControllerDelegate>

@property NSManagedObjectContext *context;

- (void)fetchReceipts;

@end
