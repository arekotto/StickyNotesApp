//
//  NoteCell.h
//  StickyNotesApp
//
//  Created by Arek Otto on 18/05/2021.
//

#import <UIKit/UIKit.h>
#import "AppCollectionViewCell.h"
#import "Note.h"

NS_ASSUME_NONNULL_BEGIN

@interface NoteCell : AppCollectionViewCell

@property (nonatomic) UITextView * bodyTextView;
@property (nonatomic) UITextField * titleTextField;

- (void)configureWithNote:(nonnull Note *)note;

@end

NS_ASSUME_NONNULL_END
