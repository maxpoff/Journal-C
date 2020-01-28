//
//  EntryListTableViewController.m
//  JournalC
//
//  Created by Maxwell Poffenbarger on 1/27/20.
//  Copyright © 2020 Maxwell Poffenbarger. All rights reserved.
//

#import "EntryListTableViewController.h"
#import "EntryController.h"
#import "Entry.h"
#import "EntryDetailViewController.h"

@interface EntryListTableViewController ()

@end

@implementation EntryListTableViewController

- (void)viewDidLoad
{

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:true];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return EntryController.sharedInstance.entries.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"entryCell" forIndexPath:indexPath];
    
    Entry *entry = EntryController.sharedInstance.entries[indexPath.row];
    
    cell.textLabel.text = entry.title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        Entry *entry = EntryController.sharedInstance.entries[indexPath.row];
        [[EntryController sharedInstance] removeEntry: entry];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toDetailVC"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        Entry *entry = [EntryController sharedInstance].entries[indexPath.row];
        
        EntryDetailViewController *destinationVC = segue.destinationViewController;
        destinationVC.entry = entry;
    }
}

@end

