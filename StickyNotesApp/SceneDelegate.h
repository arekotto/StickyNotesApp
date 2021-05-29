//
//  SceneDelegate.h
//  StickyNotesApp
//
//  Created by Arek Otto on 10/05/2021.
//

#import <UIKit/UIKit.h>
#import "NotesViewController.h"

@interface SceneDelegate : UIResponder <UIWindowSceneDelegate>

@property (nullable, strong, nonatomic) UIWindow * window;
@property (nullable, readonly, strong, nonatomic) NotesViewController * noteViewController;

@end

