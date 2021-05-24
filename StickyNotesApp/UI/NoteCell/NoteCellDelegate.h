//
//  NoteCellDelegate.h
//  StickyNotesApp
//
//  Created by Arek Otto on 23/05/2021.
//

#import <Foundation/Foundation.h>
#import "NoteCell.h"

NS_ASSUME_NONNULL_BEGIN

@protocol NoteCellDelegate <NSObject>

- (void)noteCell:(id)noteCell didUpdateNote:(Note *)updatedNote;
- (void)noteCell:(id)noteCell didDeleteNote:(Note *)deletedNote;

@end

NS_ASSUME_NONNULL_END
