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
- (nonnull NSString *)insertItem:(nonnull NSData *)data;
- (void)insertItem:(nonnull NSData *)data withId:(nonnull NSString *)uid;
- (void)removeItem:(nonnull NSString *)uid;

@end

#endif /* StorageService_h */
