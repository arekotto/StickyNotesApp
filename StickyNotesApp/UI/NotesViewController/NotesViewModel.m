//
//  NotesViewModel.m
//  StickyNotesApp
//
//  Created by Arek Otto on 18/05/2021.
//

#import "NotesViewModel.h"
#import "Note.h"
#import "StorageService.h"

@interface NotesViewModel () {
    
    StorageService * storageService;
    NSMutableArray<Note *> * _notes;
}

@end

@implementation NotesViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _notes = [[NSMutableArray<Note *> alloc] init];
        storageService = [[StorageService alloc] init];

        for (int i = 0; i < 5; i++) {
            Note * note = [[Note alloc] init];
            note.title = @"TODO";
            note.text = @"This is a very important note";
            [_notes addObject:note];
        }

//            NSString * uid = [storageService insertItem:[note toData]];
//
//            NSData * fetchedNoteData = [storageService getItem:uid];
//
//            Note * fetchedNote = [[Note alloc] initFromData:fetchedNoteData];
//            NSLog(@"%@", fetchedNote.title);
    }
    return self;
}

- (NSArray<Note *> *)notes {
    NSLog(@"%@", @"yaaaaay");
    return _notes;
}
@end
