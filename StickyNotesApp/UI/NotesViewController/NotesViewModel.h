//
//  NotesViewModel.h
//  StickyNotesApp
//
//  Created by Arek Otto on 18/05/2021.
//

#import <Foundation/Foundation.h>
#import "AppViewModel.h"
#import "Note.h"

NS_ASSUME_NONNULL_BEGIN

@interface NotesViewModel : AppViewModel

@property (nonatomic) BOOL allowsNoteDelete;
@property (nonatomic, readonly) NSUInteger numberOfNotes;

- (void)addNewNote;
- (Note *)noteAtIndexPath:(NSIndexPath *)indexPath;
- (void)updateNote:(Note *)note;
- (void)deleteNote:(Note *)note;
- (void)saveNotes;
@end

NS_ASSUME_NONNULL_END
