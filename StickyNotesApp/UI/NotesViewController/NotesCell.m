//
//  NotesCell.m
//  StickyNotesApp
//
//  Created by Arek Otto on 18/05/2021.
//

#import "NotesCell.h"

@implementation NotesCell

+ (UITextView *)makeTextView {
    UITextView * this = [[UITextView alloc] init];
    this.translatesAutoresizingMaskIntoConstraints = false;
    return this;
}

- (void)configureSubviews {
    [super configureSubviews];
    
    self.textView = [NotesCell makeTextView];
    [self.contentView addSubview:self.textView];
}

- (void)configureLayout {
    [super configureLayout];
    
    [NSLayoutConstraint activateConstraints:@[
        [self.textView.topAnchor constraintEqualToAnchor: self.topAnchor],
        [self.textView.bottomAnchor constraintEqualToAnchor: self.bottomAnchor],
        [self.textView.leadingAnchor constraintEqualToAnchor: self.leadingAnchor],
        [self.textView.trailingAnchor constraintEqualToAnchor: self.trailingAnchor]
    ]];
}

@end
