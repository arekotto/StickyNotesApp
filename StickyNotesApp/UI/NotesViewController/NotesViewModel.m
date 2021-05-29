//
//  NotesViewModel.m
//  StickyNotesApp
//
//  Created by Arek Otto on 18/05/2021.
//

#import "NotesViewModel.h"
#import "Note.h"
#import "StorageService.h"

@interface NotesViewModel ()

@property (nonatomic, readonly) StorageService * storageService;
@property (nonatomic, readonly) NSArray<NSString *> * itemIDs;

@end

@implementation NotesViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _storageService = [[StorageService alloc] init];
        [_storageService loadItems];
        _allowsNoteDelete = NO;
    }
    return self;
}

- (NSUInteger)numberOfNotes {
    return [_storageService getAllItemIDs].count;
}

- (NSArray<Note *> *)notes {
    NSMutableArray * notes = [[NSMutableArray alloc] init];
    for(NSData * data in [_storageService getAllItems]) {
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
    [_storageService insertItem:[note toData]];
}

- (void)refreshItems {
    _itemIDs = [_storageService getAllItemIDs];
}

- (Note *)noteAtIndexPath:(NSIndexPath *)indexPath {
    NSString * itemID = [_storageService getAllItemIDs][indexPath.item];
    NSData * itemData = [_storageService getItem:itemID];
    Note * note = [[Note alloc] initFromData:itemData];
    note.noteID = itemID;
    NSLog(@"%ld - %@", indexPath.item, note.title);
    return note;
}

- (void)updateNote:(Note *)note {
    [_storageService updateItem:[note toData] withID:note.noteID];
}

- (void)deleteNote:(Note *)note {
    [_storageService removeItem:note.noteID];
}

- (void)saveNotes {
    [_storageService saveItems];
}

@end
