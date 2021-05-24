//
//  NoteCell.h
//  StickyNotesApp
//
//  Created by Arek Otto on 18/05/2021.
//

#import <UIKit/UIKit.h>
#import "AppCollectionViewCell.h"
#import "Note.h"
#import "NoteCellDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface NoteCell : AppCollectionViewCell

@property (nonatomic) UITextView * bodyTextView;
@property (nonatomic) UITextField * titleTextField;

@property (nonatomic, weak) id <NoteCellDelegate> delegate;

- (void)setNote:(nonnull Note *)note;

@end

NS_ASSUME_NONNULL_END
