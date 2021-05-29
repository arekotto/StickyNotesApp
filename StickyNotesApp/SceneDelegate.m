//
//  SceneDelegate.m
//  StickyNotesApp
//
//  Created by Arek Otto on 10/05/2021.
//

#import "SceneDelegate.h"
#import "NotesViewController.h"
#import "NotesViewModel.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate

- (NotesViewController *)noteViewController {
    UINavigationController * const navC = (UINavigationController *) self.window.rootViewController;
    return (NotesViewController *) navC.childViewControllers.firstObject;
}

- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    NotesViewModel * const vm = [[NotesViewModel alloc] init];
    NotesViewController * const rootVC = [[NotesViewController alloc] initWithViewModel:vm];
    UINavigationController * const navC = [[UINavigationController alloc] initWithRootViewController:rootVC];
    navC.navigationBar.prefersLargeTitles = YES;
    [self.window setRootViewController:navC];
}

- (void)sceneDidEnterBackground:(UIScene *)scene {
    [self.noteViewController save];
}

- (void)sceneWillResignActive:(UIScene *)scene {
    [self.noteViewController save];
}

@end
