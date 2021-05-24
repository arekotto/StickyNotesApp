//
//  Note.h
//  StickyNotesApp
//
//  Created by Arek Otto on 10/05/2021.
//

#import <UIKit/UIKit.h>
#import "DataConvertible.h"

NS_ASSUME_NONNULL_BEGIN

@interface Note : DataConvertible

@property (nonatomic) NSString * noteID;
@property (nonatomic) NSString * title;
@property (nonatomic) NSString * text;
@property (nonatomic) NSString * colorHex;
@property (nonatomic) UIColor * color;

- (void)setRandomColor;

@end

NS_ASSUME_NONNULL_END
