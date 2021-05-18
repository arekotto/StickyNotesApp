//
//  NotesView.m
//  StickyNotesApp
//
//  Created by Arek Otto on 11/05/2021.
//

#import "NotesView.h"

@implementation NotesView

+ (UICollectionView *)makeCollectionView {
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
    UICollectionView * collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    return collectionView;
}

- (void)configureSubviews {
    self.collectionView = [NotesView makeCollectionView];
    [self addSubview:_collectionView];
}

- (void)configureLayout {
    [NSLayoutConstraint activateConstraints:@[
        [self.collectionView.topAnchor constraintEqualToAnchor: self.topAnchor],
        [self.collectionView.bottomAnchor constraintEqualToAnchor: self.bottomAnchor],
        [self.collectionView.leadingAnchor constraintEqualToAnchor: self.leadingAnchor],
        [self.collectionView.trailingAnchor constraintEqualToAnchor: self.trailingAnchor]
    ]];
}



@end
