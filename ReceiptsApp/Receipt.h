//
//  Receipt.h
//  ReceiptsApp
//
//  Created by Cay Cornelius on 29/09/16.
//  Copyright © 2016 Cornelius.Media. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Tag;

NS_ASSUME_NONNULL_BEGIN

@interface Receipt : NSManagedObject

@end

NS_ASSUME_NONNULL_END

#import "Receipt+CoreDataProperties.h"
