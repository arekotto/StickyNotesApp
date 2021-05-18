//
//  AppViewController.h
//  StickyNotesApp
//
//  Created by Arek Otto on 17/05/2021.
//

#import <UIKit/UIKit.h>
#import "AppView.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppViewController<T: AppView *> : UIViewController

@property (strong, nonatomic) T contentView;

- (T)makeView;

@end

NS_ASSUME_NONNULL_END
