//
//  AppCollectionViewCell.m
//  StickyNotesApp
//
//  Created by Arek Otto on 18/05/2021.
//

#import "AppCollectionViewCell.h"

@implementation AppCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
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
