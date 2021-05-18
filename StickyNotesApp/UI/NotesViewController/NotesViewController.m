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
#import "NotesCell.h"

@interface NotesViewController () <UICollectionViewDelegate>

@end

@implementation NotesViewController

-(id)makeView {
    return [[NotesView alloc] init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.contentView.collectionView.delegate = self;
    self.contentView.collectionView.dataSource = self;
    [self.contentView.collectionView registerClass:[NotesCell class] forCellWithReuseIdentifier:@"notesCell"];
    self.view.backgroundColor = UIColor.lightGrayColor;
}

@end

// MARK: - UICollectionViewDelegate

@interface NotesViewController (UICollectionViewDelegate) <UICollectionViewDelegate>

@end

@implementation NotesViewController (UICollectionViewDelegate)

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end

// MARK: - UICollectionViewDataSource

@interface NotesViewController (UICollectionViewDataSource) <UICollectionViewDataSource>

@end

@implementation NotesViewController (UICollectionViewDataSource)

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return [collectionView dequeueReusableCellWithReuseIdentifier:@"notesCell" forIndexPath:indexPath];
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSArray * notes = self.viewModel.notes;
    return self.viewModel.notes.count;
}

@end
