//
//  AddReceiptViewController.h
//  ReceiptsApp
//
//  Created by Cay Cornelius on 29/09/16.
//  Copyright © 2016 Cornelius.Media. All rights reserved.
//

#import <UIKit/UIKit.h>
@import CoreData;
@class Receipt;
@class Tag;

@protocol AddReceiptViewControllerDelegate <NSObject>

- (void) receiveBackTheContextAndFetchReceipts:(NSManagedObjectContext *)context;

@end

@interface AddReceiptViewController : UIViewController

@property (nonatomic) NSManagedObjectContext *context;
//@property (nonatomic) Tag *personalTag;
//@property (nonatomic) Tag *businessTag;
//@property (nonatomic) Tag *familyTag;
@property (nonatomic) NSFetchedResultsController *tagFetchedResultsController;
@property (nonatomic) id<AddReceiptViewControllerDelegate>delegate;

@end
