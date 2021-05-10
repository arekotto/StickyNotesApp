//
//  DataConvertible.m
//  StickyNotesApp
//
//  Created by Arek Otto on 10/05/2021.
//

#import "DataConvertible.h"

@implementation DataConvertible

- (instancetype)initFromData:(NSData *)data {
    self = [super init];
    if (self) {
        NSDictionary * dict = (NSDictionary *)[NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (NSData *)toData {
    return [NSJSONSerialization dataWithJSONObject:[self toDictionary] options:NSJSONWritingPrettyPrinted error:nil];
}

- (NSDictionary *)toDictionary {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)] userInfo:nil];
}

@end
