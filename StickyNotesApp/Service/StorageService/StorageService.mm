//
//  StorageService.m
//  StickyNotesApp
//
//  Created by Arek Otto on 10/05/2021.
//

#import <Foundation/Foundation.h>
#import "StorageService.h"
#import "StorageServiceEngine.hpp"

@interface StorageService ()

@property (nonatomic, readonly) StorageServiceEngine* engine;

@end

@implementation StorageService

+ (NSData *)rawStringToNSData:(const char *)string {
    NSString * dataString = [NSString stringWithUTF8String:string];
    return [dataString dataUsingEncoding:NSUTF8StringEncoding];
}

- (instancetype)init {
    _engine = new StorageServiceEngine();
    self = [super init];
    return self;
}

- (NSData *)getItem:(NSString *)uid {
    const char * utf8Id = [uid UTF8String];
    std::string dataRaw = _engine->getItem(std::string(utf8Id));
    return [StorageService rawStringToNSData:dataRaw.c_str()];
}

- (NSString *)insertItem:(NSData *)data {
    NSString * uuid = [[NSUUID UUID] UUIDString];
    [self insertItem:data withId:uuid];
    return uuid;
}

- (void)insertItem:(NSData *)data withId:(NSString *)uid {
    NSString * dataStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    _engine->insertItem([dataStr UTF8String], std::string([uid UTF8String]));
}

- (void)removeItem:(NSString *)uid {
    _engine->removeItem(std::string([uid UTF8String]));
}

@end
