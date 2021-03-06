//
//  AppViewController.h
//  StickyNotesApp
//
//  Created by Arek Otto on 17/05/2021.
//

#import <UIKit/UIKit.h>
#import "AppView.h"
#import "AppViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppViewController<T: AppView *, V: AppViewModel *> : UIViewController

@property (strong, nonatomic) T contentView;
@property (strong, nonatomic) V viewModel;

- (nonnull T)makeView;

@end

NS_ASSUME_NONNULL_END
