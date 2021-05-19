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
}

@end

@implementation NotesViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        storageService = [[StorageService alloc] init];
    }
    return self;
}

- (NSArray<Note *> *)notes {
    NSMutableArray * notes = [[NSMutableArray alloc] init];
    for(NSData * data in [storageService getAllItems]) {
        Note * note = [[Note alloc] initFromData:data];
        [notes addObject:note];
    }
    return notes;
}

- (void)addNewNote {
    Note * note = [[Note alloc] init];
    note.title = @"";
    note.text = @"";
    [note setRandomColor];
    [storageService insertItem:[note toData]];
}
@end
