//
//  StorageService.m
//  StickyNotesApp
//
//  Created by Arek Otto on 10/05/2021.
//

#import <Foundation/Foundation.h>
#import "StorageService.h"
#import "StorageServiceEngine.hpp"

@interface StorageService () {
    StorageServiceEngine * engine;
}

@end

@implementation StorageService

+ (NSData *)rawStringToNSData:(const char *)string {
    NSString * dataString = [NSString stringWithUTF8String:string];
    return [dataString dataUsingEncoding:NSUTF8StringEncoding];
}

- (instancetype)init {
    engine = new StorageServiceEngine();
    self = [super init];
    return self;
}

- (NSData *)getItem:(NSString *)uid {
    const char * utf8Id = [uid UTF8String];
    const char * dataRaw = engine->getItem(std::string(utf8Id));
    return [StorageService rawStringToNSData:dataRaw];
}

- (NSArray<NSData *> *)getAllItems {
    NSMutableArray<NSData *> * allItems = [[NSMutableArray alloc] init];
    const char ** dataRaw = engine->getAllItems();
    const char ** currentItem = dataRaw;
    for ( ; *currentItem != NULL; currentItem++ ) {
        [allItems addObject:[StorageService rawStringToNSData:*currentItem]];
    }
    return allItems;
}

- (NSArray<NSString *> *)getAllItemIDs {
    NSMutableArray<NSString *> * allIDs = [[NSMutableArray alloc] init];
    const char ** dataRaw = engine->getAllItemIDs();
    const char ** currentID = dataRaw;
    for ( ; *currentID != NULL; currentID++ ) {
        [allIDs addObject: [NSString stringWithUTF8String:*currentID]];
    }
    return allIDs;
}

- (NSString *)insertItem:(NSData *)data {
    NSString * uuid = [[NSUUID UUID] UUIDString];
    [self insertItem:data withId:uuid];
    return uuid;
}

- (void)insertItem:(NSData *)data withId:(NSString *)uid {
    NSString * dataStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    engine->insertItem([dataStr UTF8String], std::string([uid UTF8String]));
}

- (void)updateItem:(NSData *)data withID:(NSString *)uid {
    NSString * dataStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    engine->updateItem([dataStr UTF8String], std::string([uid UTF8String]));
}

- (void)removeItem:(NSString *)uid {
    engine->removeItem(std::string([uid UTF8String]));
}

- (void)saveItems {
    engine->save();
}

- (void)loadItems {
    engine->load();
}

@end
