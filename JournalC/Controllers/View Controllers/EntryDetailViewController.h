//
//  EntryDetailViewController.h
//  JournalC
//
//  Created by Maxwell Poffenbarger on 1/27/20.
//  Copyright © 2020 Maxwell Poffenbarger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EntryController.h"

NS_ASSUME_NONNULL_BEGIN

@interface EntryDetailViewController : UIViewController

@property (nonatomic, strong) Entry *entry;

#pragma mark - Outlets

@property (weak, nonatomic) IBOutlet UITextField *entryTitleLabel;
@property (weak, nonatomic) IBOutlet UITextView *entryBodyTextField;

@end

NS_ASSUME_NONNULL_END
