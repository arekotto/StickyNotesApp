//
//  DataConvertable.h
//  StickyNotesApp
//
//  Created by Arek Otto on 10/05/2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DataConvertible : NSObject

- (nullable instancetype)initFromData:(nonnull NSData *)data;
- (NSData *)toData;
- (NSDictionary *)toDictionary;

@end

NS_ASSUME_NONNULL_END
