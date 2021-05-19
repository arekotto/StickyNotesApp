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

@property (nonatomic, readonly) NSArray<Note *> * notes;

- (void)addNewNote;

@end

NS_ASSUME_NONNULL_END
