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

+ (NSData *)rawStringToNSData:(std::string)string {
    NSString * dataString = [NSString stringWithUTF8String:string.c_str()];
    return [dataString dataUsingEncoding:NSUTF8StringEncoding];
}

- (instancetype)init {
    engine = new StorageServiceEngine();
    self = [super init];
    return self;
}

- (NSData *)getItem:(NSString *)uid {
    auto * item = engine->getItem(std::string([uid UTF8String]));
    if (item == nullptr) {
        return nil;
    }
    NSData * itemData = [StorageService rawStringToNSData:*item];
    delete item;
    item = nullptr;
    return itemData;
}

- (NSArray<NSData *> *)getAllItems {
    NSMutableArray<NSData *> * allItems = [[NSMutableArray alloc] init];
    for (auto item : engine->getAllItems()) {
        [allItems addObject:[StorageService rawStringToNSData:item]];
    }
    return allItems;
}

- (NSArray<NSString *> *)getAllItemIDs {
    NSMutableArray<NSString *> * allIDs = [[NSMutableArray alloc] init];
    for (auto itemID : engine->getAllItemIDs()) {
        [allIDs addObject: [NSString stringWithUTF8String:itemID.c_str()]];
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
