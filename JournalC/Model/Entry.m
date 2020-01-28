//
//  Entry.m
//  JournalC
//
//  Created by Maxwell Poffenbarger on 1/27/20.
//  Copyright © 2020 Maxwell Poffenbarger. All rights reserved.
//

#import "Entry.h"

@implementation Entry

static NSString * const TitleKey = @"title";
static NSString * const TextKey = @"text";
static NSString * const TimestampKey = @"timestamp";

- (instancetype)initWithTitle:(NSString *)title bodytext:(NSString *)bodytext timestamp:(NSDate *)timestamp
{
    self = [super init];
    if (self)
    {
        _title = title;
        _bodytext = bodytext;
        _timestamp = [NSDate now];
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *title = dictionary[TitleKey];
    NSString *bodytext = dictionary[TextKey];
    NSDate *timestamp = dictionary[TimestampKey];
    return [self initWithTitle:title bodytext:bodytext timestamp:timestamp];
}

- (NSDictionary *)dictionaryRepresentation
{
    return @{TitleKey: self.title,
             TextKey: self.bodytext,
             TimestampKey: self.timestamp};
}

- (BOOL)isEqual:(id)object
{
    if (![object isKindOfClass:[Entry class]]) { return NO; }
    return [[self dictionaryRepresentation] isEqualToDictionary:[(Entry *)object dictionaryRepresentation]];
}
@end


