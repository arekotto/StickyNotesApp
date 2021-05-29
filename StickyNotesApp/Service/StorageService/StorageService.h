//
//  StorageService.h
//  StickyNotesApp
//
//  Created by Arek Otto on 10/05/2021.
//

#ifndef StorageService_h
#define StorageService_h

#import <Foundation/Foundation.h>

@interface StorageService : NSObject

- (nullable NSData *)getItem:(NSString * _Nonnull)uid;
- (nonnull NSArray<NSData *> *)getAllItems;
- (nonnull NSArray<NSString *> *)getAllItemIDs;
- (nonnull NSString *)insertItem:(nonnull NSData *)data;
- (void)updateItem:(nonnull NSData *)data withID:(nonnull NSString *)uid;
- (void)insertItem:(nonnull NSData *)data withId:(nonnull NSString *)uid;
- (void)removeItem:(nonnull NSString *)uid;
- (void)saveItems;
- (void)loadItems;
@end

#endif /* StorageService_h */
