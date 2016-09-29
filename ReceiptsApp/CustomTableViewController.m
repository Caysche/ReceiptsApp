//
//  CustomTableViewController.m
//  ReceiptsApp
//
//  Created by Cay Cornelius on 29/09/16.
//  Copyright © 2016 Cornelius.Media. All rights reserved.
//

#import "CustomTableViewController.h"
#import "CustomTableViewCell.h"
#import "Tag.h"
#import "Receipt.h"

@interface CustomTableViewController () <NSFetchedResultsControllerDelegate>

@property (nonatomic) NSFetchedResultsController *receiptsFetchedResultsController;
@property (nonatomic) NSFetchedResultsController *tagFetchedResultsController;


@end

@implementation CustomTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setUpTags];
    [self fetchReceipts];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Set up core data

- (void)setUpTags {
    NSFetchRequest *tagFetchRequest = [Tag fetchRequest];
    
    NSSortDescriptor *sortDescription = [NSSortDescriptor sortDescriptorWithKey:@"tagName" ascending:NO];
    tagFetchRequest.sortDescriptors = @[sortDescription];
    
    self.tagFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:tagFetchRequest managedObjectContext:self.context sectionNameKeyPath:nil cacheName:nil];
    
    self.tagFetchedResultsController.delegate = self;
    
    NSError *fetchError = nil;
    [self.tagFetchedResultsController performFetch:&fetchError];
    
    if ([self.tagFetchedResultsController.sections count] < 3) {
        
        Tag *familyTag = [[Tag alloc] initWithContext:self.context];
        familyTag.tagName = @"Family";
        Tag *businessTag = [[Tag alloc] initWithContext:self.context];
        businessTag.tagName = @"Business";
        Tag *personalTag = [[Tag alloc] initWithContext:self.context];
        personalTag.tagName = @"Personal";
        
        // Save the context.
        NSError *error = nil;
        if (![self.context save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, error.userInfo);
            abort();
        }

    }
}

- (void)fetchReceipts {
    NSFetchRequest *tagFetchRequest = [Receipt fetchRequest];
    
    NSSortDescriptor *sortDescription = [NSSortDescriptor sortDescriptorWithKey:@"note" ascending:YES];
    tagFetchRequest.sortDescriptors = @[sortDescription];
    
    self.receiptsFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:tagFetchRequest managedObjectContext:self.context sectionNameKeyPath:nil cacheName:nil];
    
    self.receiptsFetchedResultsController.delegate = self;
    
    NSError *fetchError = nil;
    [self.receiptsFetchedResultsController performFetch:&fetchError];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.tagFetchedResultsController.fetchedObjects count];;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    id<NSFetchedResultsSectionInfo> sectionInfo = [self.receiptsFetchedResultsController.sections objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    Tag *sectionTag = [self.tagFetchedResultsController.fetchedObjects objectAtIndex:section];
    return sectionTag.tagName;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"receiptCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
