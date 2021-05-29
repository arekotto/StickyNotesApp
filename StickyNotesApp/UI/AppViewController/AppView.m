//
//  AppView.m
//  StickyNotesApp
//
//  Created by Arek Otto on 11/05/2021.
//

#import "AppView.h"

@implementation AppView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self configureSelf];
        [self configureSubviews];
        [self configureLayout];
    }
    return self;
}

- (void)configureSelf {
    // to be overridden
}

- (void)configureSubviews {
    // to be overridden
}

- (void)configureLayout {
    // to be overridden
}

@end
