//
//  Note.h
//  StickyNotesApp
//
//  Created by Arek Otto on 10/05/2021.
//

#import <Foundation/Foundation.h>
#import "DataConvertible.h"

NS_ASSUME_NONNULL_BEGIN

@interface Note : DataConvertible

@property (nonatomic) NSString *title;
@property (nonatomic) NSString *text;

@end

NS_ASSUME_NONNULL_END
