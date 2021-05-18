//
//  NotesViewController.m
//  StickyNotesApp
//
//  Created by Arek Otto on 10/05/2021.
//

#import "NotesViewController.h"
#import "StorageService.h"
#import "Note.h"
#import "NotesView.h"

@interface NotesViewController ()

@end

@implementation NotesViewController

-(id)makeView {
    return [[NotesView alloc] init];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    Note * note = [[Note alloc] init];
    note.title = @"TODO";
    note.text = @"This is a very important note";
    
    StorageService * storageService = [[StorageService alloc] init];
    
    NSString * uid = [storageService insertItem:[note toData]];

    NSData * fetchedNoteData = [storageService getItem:uid];
    
    Note * fetchedNote = [[Note alloc] initFromData:fetchedNoteData];
    NSLog(@"%@", fetchedNote.title);
    
    UIButton * button = ^ UIButton * (){
        UIButton * button = [[UIButton alloc] init];
        return button;
    }();

    self.view.backgroundColor = UIColor.orangeColor;
}


@end
