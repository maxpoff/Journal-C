//
//  Entry.h
//  JournalC
//
//  Created by Maxwell Poffenbarger on 1/27/20.
//  Copyright © 2020 Maxwell Poffenbarger. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Entry : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *bodytext;
@property (nonatomic, copy) NSDate *timestamp;

- (instancetype) initWithTitle: (NSString *)title
                      bodytext: (NSString *)bodytext
                     timestamp: (NSDate *)timestamp;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)dictionaryRepresentation;

@end

NS_ASSUME_NONNULL_END
