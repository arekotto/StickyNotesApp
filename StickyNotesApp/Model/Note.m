//
//  Note.m
//  StickyNotesApp
//
//  Created by Arek Otto on 10/05/2021.
//

#import "Note.h"
#import "UIColor+Extensions.h"

@implementation Note

+ (nonnull UIColor *)randomBackgroundColor {
    NSArray<UIColor *> * colors = @[UIColor.systemYellowColor,
                                    UIColor.systemPinkColor,
                                    UIColor.systemTealColor];
    int count = (int)[colors count];
    return [colors objectAtIndex:arc4random_uniform(count)];
}

@synthesize title;
@synthesize text;
@synthesize colorHex;

-(NSDictionary *)toDictionary {
    return [self dictionaryWithValuesForKeys:@[@"title", @"text", @"colorHex"]];
}

- (NSData *)toData {
    return [NSJSONSerialization dataWithJSONObject:[self toDictionary] options:NSJSONWritingPrettyPrinted error:nil];
}

- (UIColor *)color {
    return [UIColor colorFromHexString:colorHex];
}

- (void)setColor:(UIColor *)color {
    colorHex = [color toHexString];
}

- (void)setRandomColor {
    [self setColor: [Note randomBackgroundColor]];
}

@end
