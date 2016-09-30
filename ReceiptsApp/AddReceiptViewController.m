//
//  AddReceiptViewController.m
//  ReceiptsApp
//
//  Created by Cay Cornelius on 29/09/16.
//  Copyright © 2016 Cornelius.Media. All rights reserved.
//

#import "AddReceiptViewController.h"
#import "Receipt.h"
#import "CustomTableViewController.h"
#import "Tag.h"
#import "AppDelegate.h"

@interface AddReceiptViewController ()
@property (weak, nonatomic) IBOutlet UITextField *amountLabel;
@property (weak, nonatomic) IBOutlet UITextField *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIDatePicker *timeStampPicker;
@property (nonatomic) BOOL personalButtonIsSelected;
@property (nonatomic) BOOL familyButtonIsSelected;
@property (nonatomic) BOOL businessButtonIsSelected;


@end

@implementation AddReceiptViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.personalButtonIsSelected = NO;
    self.familyButtonIsSelected = NO;
    self.businessButtonIsSelected = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)personalButtonSelected:(UIButton *)sender {
    if(sender.selected == YES)
    {
        self.personalButtonIsSelected = NO;
        [sender setSelected:NO];
    }
    else
    {
        self.personalButtonIsSelected = YES;
        [sender setSelected:YES];
    }
}


- (IBAction)familyButtonSelected:(UIButton *)sender {
    if(sender.selected == YES)
    {
        self.familyButtonIsSelected = NO;
        [sender setSelected:NO];
    }
    else
    {
        self.familyButtonIsSelected = YES;
        [sender setSelected:YES];
    }
}
- (IBAction)businessButtonSelected:(UIButton *)sender {
    if(sender.selected == YES)
    {
        self.businessButtonIsSelected = NO;
        [sender setSelected:NO];
    }
    else
    {
        self.businessButtonIsSelected = YES;
        [sender setSelected:YES];
    }
}
- (IBAction)cancelButtonPressed:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)doneButtonPressed:(UIButton *)sender {
    Receipt *newReceipt = [NSEntityDescription insertNewObjectForEntityForName:@"Receipt" inManagedObjectContext:self.context];
    newReceipt.amount = [self.amountLabel.text integerValue];
    newReceipt.note = self.descriptionLabel.text;
    newReceipt.timeStamp = self.timeStampPicker.date;
    
    NSArray *fetchedTags = [self.tagFetchedResultsController fetchedObjects];
    for (Tag *tag in fetchedTags) {
        if (self.personalButtonIsSelected == YES) {
            if ([tag.tagName isEqual: @"Personal"]) {
                [newReceipt addTagsObject:tag];
            }
        }
        if (self.familyButtonIsSelected == YES) {
            if ([tag.tagName isEqual: @"Business"]) {
                [newReceipt addTagsObject:tag];
            }
        }
        if (self.businessButtonIsSelected == YES) {
            if ([tag.tagName isEqual: @"Family"]) {
                [newReceipt addTagsObject:tag];
            }
        }
    }
    
    // Save the context
    
    NSError *error = nil;
    if (![self.context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
    [self.delegate receiveBackTheContextAndFetchReceipts:self.context];
    [self.navigationController popViewControllerAnimated:YES];

}



@end
