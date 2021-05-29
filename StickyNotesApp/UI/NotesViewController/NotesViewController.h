//
//  NotesViewController.h
//  StickyNotesApp
//
//  Created by Arek Otto on 10/05/2021.
//

#import <UIKit/UIKit.h>
#import "AppViewController.h"
#import "NotesView.h"
#import "NotesViewModel.h"

@interface NotesViewController : AppViewController<NotesView *, NotesViewModel *>

- (instancetype)initWithViewModel:(NotesViewModel *)viewModel;
- (void)save;

@end

