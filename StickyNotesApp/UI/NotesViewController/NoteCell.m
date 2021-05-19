//
//  NoteCell.m
//  StickyNotesApp
//
//  Created by Arek Otto on 18/05/2021.
//

#import "NoteCell.h"

@interface NoteCell () <UITextFieldDelegate>
    
@property (nonatomic) UIStackView * mainStackView;

@end

@implementation NoteCell

+ (UITextField * const)makeTitleTextField {
    UITextField * const this = [[UITextField alloc] init];
    this.translatesAutoresizingMaskIntoConstraints = NO;
    this.font = [UIFont boldSystemFontOfSize:20];
    this.placeholder = @"Title";
    this.backgroundColor = UIColor.clearColor;
    this.textAlignment = NSTextAlignmentCenter;
    return this;
}

+ (UITextView * const)makeBodyTextView {
    UITextView * const this = [[UITextView alloc] init];
    this.translatesAutoresizingMaskIntoConstraints = NO;
    this.backgroundColor = UIColor.clearColor;
    return this;
}

+ (UIStackView * const)makeMainStackView {
    UIStackView * const this = [[UIStackView alloc] init];
    this.translatesAutoresizingMaskIntoConstraints = NO;
    this.axis = UILayoutConstraintAxisVertical;
    this.directionalLayoutMargins = NSDirectionalEdgeInsetsMake(4, 4, 4, 4);
    [this setLayoutMarginsRelativeArrangement:YES];
    return this;
}

- (void)configureSubviews {
    [super configureSubviews];
    
    self.mainStackView = [NoteCell makeMainStackView];
    [self.contentView addSubview:self.mainStackView];

    self.titleTextField = [NoteCell makeTitleTextField];
    self.titleTextField.delegate = self;
    [self.mainStackView addArrangedSubview:self.titleTextField];
    
    self.bodyTextView = [NoteCell makeBodyTextView];
    [self.mainStackView addArrangedSubview:self.bodyTextView];
}

- (void)configureLayout {
    [super configureLayout];
    
    [NSLayoutConstraint activateConstraints:@[
        [self.titleTextField.heightAnchor constraintEqualToAnchor:self.widthAnchor multiplier:0.2],
        [self.mainStackView.topAnchor constraintEqualToAnchor:self.topAnchor constant:8],
        [self.mainStackView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-8],
        [self.mainStackView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:8],
        [self.mainStackView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-8]
    ]];
}

- (void)configureWithNote:(Note *)note {
    _bodyTextView.text = note.text;
    _mainStackView.backgroundColor = note.color;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.bodyTextView becomeFirstResponder];
    return YES;
}

@end
