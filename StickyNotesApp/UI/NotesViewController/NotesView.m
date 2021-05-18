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
    CGFloat itemSize = UIScreen.mainScreen.bounds.size.width / 2;
    flowLayout.itemSize = CGSizeMake(itemSize - 5, itemSize - 5);
    UICollectionView * this = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    this.translatesAutoresizingMaskIntoConstraints = false;
    this.backgroundColor = UIColor.clearColor;
    return this;
}

- (void)configureSubviews {
    [super configureSubviews];
    self.collectionView = [NotesView makeCollectionView];
    [self addSubview:_collectionView];
}

- (void)configureLayout {
    [super configureLayout];
    [NSLayoutConstraint activateConstraints:@[
        [self.collectionView.topAnchor constraintEqualToAnchor: self.topAnchor],
        [self.collectionView.bottomAnchor constraintEqualToAnchor: self.bottomAnchor],
        [self.collectionView.leadingAnchor constraintEqualToAnchor: self.leadingAnchor],
        [self.collectionView.trailingAnchor constraintEqualToAnchor: self.trailingAnchor]
    ]];
}



@end
