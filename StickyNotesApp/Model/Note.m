//
//  Note.m
//  StickyNotesApp
//
//  Created by Arek Otto on 10/05/2021.
//

#import "Note.h"

@implementation Note

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)coder {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.title = [coder decodeObjectForKey:@"title"];
    self.text = [coder decodeObjectForKey:@"text"];
    
    return self;
}

- (void)encodeWithCoder:(nonnull NSCoder *)coder {
    // todo
}

@end
