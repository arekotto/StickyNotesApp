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

- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    NotesViewModel * vm = [[NotesViewModel alloc] init];
    NotesViewController * rootVC = [[NotesViewController alloc] initWithViewModel:vm];
    [self.window setRootViewController:[[UINavigationController alloc] initWithRootViewController:rootVC]];
}

- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}

@end
