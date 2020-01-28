//
//  EntryController.h
//  JournalC
//
//  Created by Maxwell Poffenbarger on 1/27/20.
//  Copyright © 2020 Maxwell Poffenbarger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entry.h"

NS_ASSUME_NONNULL_BEGIN

@interface EntryController : NSObject

@property (nonatomic, strong) NSMutableArray *entries;

+ (EntryController *)sharedInstance;

- (void)addEntry:(Entry *)entry;

- (void)removeEntry:(Entry *)entry;

- (void)updateEntry:(Entry *)entry title:(NSString *)title bodyText:(NSString *)body;

- (void)saveToPersistentStorage;

- (void)loadFromPersistentStorage;

@end

NS_ASSUME_NONNULL_END

