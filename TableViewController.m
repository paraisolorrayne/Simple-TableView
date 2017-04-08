//
//  TableViewController.m
//  TableView
//
//  Created by Zup Beta on 02/02/17.
//  Copyright © 2017 Zup Beta. All rights reserved.
//

#import "TableViewController.h"
#import "ViewController.h"

@interface TableViewController ()
@property (strong, nonatomic) NSMutableArray *fruits;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.fruits = [NSMutableArray arrayWithObjects:@"Abacate", @"Abacaxi", @"Ameixa", @"Banana", @"Caju", @"Damasco", @"Framboesa", @"Goiaba", @"Graviola", @"Laranja", @"Maca", @"Melancia", @"Maracuja", @"Pessego", @"Uva", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _fruits.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [tableView dequeueReusableCellWithIdentifier:@"cellTeste"];
}

-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *name = @"List fruits";
    return name;
}


 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
     return YES;
 }


- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *strFruit = [self.fruits objectAtIndex:[indexPath row]];
    [cell.textLabel setText:strFruit];
    [cell setBackgroundColor:[UIColor clearColor]];
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ViewController *view  = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"next"];
    [self.navigationController pushViewController:view animated:YES];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        UIAlertController *view = [UIAlertController
                                   alertControllerWithTitle:@"Warning"
                                   message:@"Deletar Item?"
                                   preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* yes = [UIAlertAction
                               actionWithTitle:@"YES"
                               style:UIAlertActionStyleDestructive
                               handler:^(UIAlertAction *action) {
                                   
                                   [self.fruits removeObjectAtIndex:indexPath.row];
                                   [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
                                   
                                   NSArray *viewControllersFromStack = [self.navigationController viewControllers];
                                   for(UIViewController *currentVC in [viewControllersFromStack reverseObjectEnumerator]) {
                                       [currentVC.navigationController popViewControllerAnimated:NO];
                                   }
                                   [view dismissViewControllerAnimated:YES completion:^{
                                   }];
                               }];
        
        UIAlertAction* no = [UIAlertAction
                              actionWithTitle:@"NO"
                              style:UIAlertActionStyleDestructive
                              handler:^(UIAlertAction *action) {
                                  NSArray *viewControllersFromStack = [self.navigationController viewControllers];
                                  for(UIViewController *currentVC in [viewControllersFromStack reverseObjectEnumerator]) {
                                      [currentVC.navigationController popViewControllerAnimated:NO];
                                  }
                                  [view dismissViewControllerAnimated:YES completion:^{
                                  }];
                              }];
        
        [view addAction:yes];
        [view addAction:no];
        [self presentViewController:view animated:YES completion:nil];
        
    }

}


 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
     if (indexPath.row == 0) // Don't move the first row
         return NO;
     
     return YES;
 }
 
/*
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    if (fromIndexPath != toIndexPath ) {
        
    }
}
 */

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    NSString *stringToMove = [self.fruits objectAtIndex:sourceIndexPath.row];
    [self.fruits removeObjectAtIndex:sourceIndexPath.row];
    [self.fruits insertObject:stringToMove atIndex:destinationIndexPath.row];
    
}




/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
