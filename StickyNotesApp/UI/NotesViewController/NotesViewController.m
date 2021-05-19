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
#import "NoteCell.h"
#import "NotesViewController+UICollectionViewDataSource.h"

@interface NotesViewController ()

@end

@implementation NotesViewController

- (nonnull instancetype)initWithViewModel:(NotesViewModel *)viewModel {
    self = [super init];
    if (self) {
        self.viewModel = viewModel;
    }
    return self;
}

-(NotesView *)makeView {
    return [[NotesView alloc] init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = NSLocalizedString(@"Notes", @"");
    UIBarButtonItem * newNoteButton = [UIBarButtonItem alloc];
    newNoteButton = [newNoteButton initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(newNote)];
    [self.navigationItem setRightBarButtonItem:newNoteButton];
    
    self.contentView.collectionView.dataSource = self;
    [self.contentView.collectionView registerClass:[NoteCell class] forCellWithReuseIdentifier:@"notesCell"];
}

- (void)newNote {
    [self.viewModel addNewNote];
    [self.contentView.collectionView reloadData];
}

@end

