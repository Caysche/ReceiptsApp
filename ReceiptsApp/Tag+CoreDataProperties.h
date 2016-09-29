//
//  Tag+CoreDataProperties.h
//  ReceiptsApp
//
//  Created by Cay Cornelius on 29/09/16.
//  Copyright © 2016 Cornelius.Media. All rights reserved.
//

#import "Tag.h"


NS_ASSUME_NONNULL_BEGIN

@interface Tag (CoreDataProperties)

+ (NSFetchRequest<Tag *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *tagName;
@property (nullable, nonatomic, retain) NSSet<Receipt *> *receipts;

@end

@interface Tag (CoreDataGeneratedAccessors)

- (void)addReceiptsObject:(Receipt *)value;
- (void)removeReceiptsObject:(Receipt *)value;
- (void)addReceipts:(NSSet<Receipt *> *)values;
- (void)removeReceipts:(NSSet<Receipt *> *)values;

@end

NS_ASSUME_NONNULL_END
