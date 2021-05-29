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
#import "NotesViewController+NoteCellDelegate.h"

@interface NotesViewController ()

@property (nonatomic) UIBarButtonItem * beginDeletingNotesButton;
@property (nonatomic) UIBarButtonItem * endDeletingNotesButton;

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
    
    self.beginDeletingNotesButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(beginDeletingNotesButtonTapped:)];
    [self.navigationItem setLeftBarButtonItem:self.beginDeletingNotesButton];
    
    self.endDeletingNotesButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(endDeletingNotesButtonTapped:)];
    
    self.contentView.collectionView.dataSource = self;
    [self.contentView.collectionView registerClass:[NoteCell class] forCellWithReuseIdentifier:@"notesCell"];
}

- (void)newNote {
    [self.viewModel addNewNote];
    [self.contentView.collectionView reloadData];
}

- (void)beginDeletingNotesButtonTapped:(UIBarButtonItem *) button {
    self.viewModel.allowsNoteDelete = YES;
    [self.contentView.collectionView reloadData];
    [self.navigationItem setLeftBarButtonItem:self.endDeletingNotesButton animated:YES];
}

- (void)endDeletingNotesButtonTapped:(UIBarButtonItem *) button {
    self.viewModel.allowsNoteDelete = NO;
    [self.contentView.collectionView reloadData];
    [self.navigationItem setLeftBarButtonItem:self.beginDeletingNotesButton animated:YES];
}

- (void)save {
    [self.viewModel saveNotes];
}
@end

