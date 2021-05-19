//
//  NotesViewController+UICollectionViewDataSource.h
//  StickyNotesApp
//
//  Created by Arek Otto on 18/05/2021.
//

#import "NotesViewController.h"
#import "NoteCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface NotesViewController (UICollectionViewDataSource) <UICollectionViewDataSource>

@end

@implementation NotesViewController (UICollectionViewDataSource)

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.viewModel.notes.count;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NoteCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"notesCell" forIndexPath:indexPath];
    [cell configureWithNote: self.viewModel.notes[indexPath.item]];
    return cell;
}

@end

NS_ASSUME_NONNULL_END
