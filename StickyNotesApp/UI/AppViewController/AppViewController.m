//
//  AppViewController.m
//  StickyNotesApp
//
//  Created by Arek Otto on 17/05/2021.
//

#import "AppViewController.h"

@interface AppViewController<T: AppView *, V: AppViewModel *> ()
    
@end

@implementation AppViewController

- (nonnull id)makeView {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)] userInfo:nil];
}

-(void)loadView {
    _contentView = [self makeView];
    self.view = _contentView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
