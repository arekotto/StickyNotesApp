//
//  NotesViewController+UICollectionViewDataSource.h
//  StickyNotesApp
//
//  Created by Arek Otto on 18/05/2021.
//

#import "NotesViewController.h"
#import "NotesViewController+NoteCellDelegate.h"
#import "NoteCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface NotesViewController (UICollectionViewDataSource) <UICollectionViewDataSource>

@end

@implementation NotesViewController (UICollectionViewDataSource)

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.viewModel.numberOfNotes;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NoteCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"notesCell" forIndexPath:indexPath];
    [cell setNote: [self.viewModel noteAtIndexPath:indexPath] ];
    cell.delegate = self;
    return cell;
}

@end

NS_ASSUME_NONNULL_END
