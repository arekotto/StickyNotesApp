//
//  Note.m
//  StickyNotesApp
//
//  Created by Arek Otto on 10/05/2021.
//

#import "Note.h"

@implementation Note

@synthesize title;
@synthesize text;

-(NSDictionary *)toDictionary {
    return [self dictionaryWithValuesForKeys:@[@"title", @"text"]];
}

- (NSData *)toData {
    return [NSJSONSerialization dataWithJSONObject:[self toDictionary] options:NSJSONWritingPrettyPrinted error:nil];
}

@end
