//
//  ViewController.m
//  TableView
//
//  Created by Zup Beta on 02/02/17.
//  Copyright © 2017 Zup Beta. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _mesageLabel.text = @"Fruta selecionada";
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)exit:(id)sender {
    UIAlertController *view = [UIAlertController
                               alertControllerWithTitle:@""
                               message:@"Retornar"
                               preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* exit = [UIAlertAction
                           actionWithTitle:@"Exit"
                           style:UIAlertActionStyleDestructive
                           handler:^(UIAlertAction *action) {
                               NSArray *viewControllersFromStack = [self.navigationController viewControllers];
                               for(UIViewController *currentVC in [viewControllersFromStack reverseObjectEnumerator]) {
                                   [currentVC.navigationController popViewControllerAnimated:NO];
                               }
                               [view dismissViewControllerAnimated:YES completion:^{
                               }];
                           }];
    [view addAction:exit];
    [self presentViewController:view animated:YES completion:nil];
}

@end
