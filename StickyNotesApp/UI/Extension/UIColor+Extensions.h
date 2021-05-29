//
//  UIColor+Extensions.h
//  StickyNotesApp
//
//  Created by Arek Otto on 18/05/2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Hex)

+ (UIColor *)colorFromHexString:(NSString *)hexString;

- (NSString *)toHexString;

@end



NS_ASSUME_NONNULL_END
