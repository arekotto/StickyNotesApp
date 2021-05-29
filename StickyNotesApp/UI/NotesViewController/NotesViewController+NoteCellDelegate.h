//
//  NotesViewController+NotesViewController_NoteCellDelegate.h
//  StickyNotesApp
//
//  Created by Arek Otto on 23/05/2021.
//

#import "NotesViewController.h"
#import "NoteCellDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface NotesViewController (NoteCellDelegate) <NoteCellDelegate>

@end

@implementation NotesViewController (NoteCellDelegate)

- (void)noteCell:(id)noteCell didUpdateNote:(Note *)updatedNote {
    [self.viewModel updateNote:updatedNote];
}

- (void)noteCell:(id)noteCell didDeleteNote:(Note *)deletedNote {
    [self.viewModel deleteNote:deletedNote];
    [self.contentView.collectionView reloadData];
}

@end

NS_ASSUME_NONNULL_END
