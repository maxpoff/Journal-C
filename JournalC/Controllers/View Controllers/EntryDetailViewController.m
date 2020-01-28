//
//  EntryDetailViewController.m
//  JournalC
//
//  Created by Maxwell Poffenbarger on 1/27/20.
//  Copyright © 2020 Maxwell Poffenbarger. All rights reserved.
//

#import "EntryDetailViewController.h"
#import "EntryController.h"

@interface EntryDetailViewController () <UITableViewDelegate>

@end

@implementation EntryDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateViews];
}

#pragma mark - Actions

- (IBAction)saveButtonTapped:(id)sender
{
    if (self.entry)
    {
        self.entry.title = self.entryTitleLabel.text;
        self.entry.bodytext = self.entryBodyTextField.text;
        self.entry.timestamp = [NSDate date];
    } else
    {
        Entry *entry = [[Entry alloc] initWithTitle: self.entryTitleLabel.text bodytext: self.entryBodyTextField.text timestamp: [[NSDate alloc] init]];
        [[EntryController sharedInstance] addEntry:entry];
        self.entry = entry;
    }
    [self.navigationController popViewControllerAnimated:true];
}

- (IBAction)clearButtonTapped:(id)sender
{
    self.entryTitleLabel.text = @"";
    self.entryBodyTextField.text = @"";
}

#pragma mark - Private Methods

- (void)updateViews
{
    if (!self.entry) return;
    
    self.entryTitleLabel.text = self.entry.title;
    self.entryBodyTextField.text = self.entry.bodytext;
}

@end
