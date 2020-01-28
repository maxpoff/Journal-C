//
//  EntryController.m
//  JournalC
//
//  Created by Maxwell Poffenbarger on 1/27/20.
//  Copyright © 2020 Maxwell Poffenbarger. All rights reserved.
//

#import "EntryController.h"

static NSString * const EntriesKey = @"entries";

@interface EntryController ()

@property (nonatomic, strong) NSMutableArray *internalEntries;

@end

@implementation EntryController

+ (EntryController *)sharedInstance
{
    static EntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[EntryController alloc] init];
        [sharedInstance loadFromPersistentStorage];
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _entries = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void) addEntry:(Entry *)entry
{
    [self.entries addObject:entry];
    [self saveToPersistentStorage];
}

- (void) removeEntry:(Entry *)entry
{
    [self.entries removeObject:entry];
    [self saveToPersistentStorage];
}

- (void) updateEntry:(Entry *)entry title:(NSString *)title bodyText:(NSString *)body
{
    entry.title = title;
    entry.bodytext = body;
    [self saveToPersistentStorage];
}

#pragma mark - Persistent Storage

- (void)saveToPersistentStorage
{
    NSMutableArray *entryDictionaries = [NSMutableArray new];
    
    for (Entry *entry in self.entries) {
        [entryDictionaries addObject:entry.dictionaryRepresentation];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:entryDictionaries forKey:EntriesKey];
}

- (void)loadFromPersistentStorage
{
    NSArray *entryDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:EntriesKey];
    for (NSDictionary *dictionary in entryDictionaries) {
        Entry *entry = [[Entry alloc] initWithDictionary:dictionary];
        [self addEntry:entry];
    }
}

//- (void)saveToPersistentStore {
//    NSMutableArray *entriesToSave = [NSMutableArray<NSDictionary *> new];
//    for (Entry *entry in self.entries) {
//        [entriesToSave addObject:[entry dictionaryRepresentation]];
//    }
//    NSError *error = nil;
//    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:entriesToSave
//                                                       options:kNilOptions
//                                                         error:&error];
//    if (error) {
//        NSLog(@"Unable to convert entries to JSON: %@", error);
//        return;
//    }
//    NSURL *url = [EntryController persistentStoreFileURL];
//    [jsonData writeToURL:url atomically:YES];
//}
//- (void)loadFromPersistentStore {
//    NSURL *url = [EntryController persistentStoreFileURL];
//    NSError *error;
//    NSData *data = [NSData dataWithContentsOfURL:url options:kNilOptions error:&error];
//    if (error) {
//        NSLog(@"Error loading JSON data from file: %@", error);
//        return;
//    }
//    NSArray *rawEntries = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
//    if (error) {
//        NSLog(@"Error converting JSON data to NSObject: %@", error);
//        return;
//    }
//    NSMutableArray *newEntries = [NSMutableArray new];
//    for (NSDictionary *entryDict in rawEntries) {
//        Entry *entry = [[Entry alloc] initWithDictionary:entryDict];
//        if (entry) {
//            [newEntries addObject:entry];
//        }
//    }
//    self.entries = newEntries;
//}
//+ (NSURL *)persistentStoreFileURL {
//    NSArray<NSURL *> *urls = [[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory
//                                                                    inDomains:NSUserDomainMask];
//    return [urls[0] URLByAppendingPathComponent:@"journal.json"];
//}

@end
