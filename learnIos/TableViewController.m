//
//  TableViewController.m
//  learnIos
//
//  Created by Mariami on 5/19/20.
//  Copyright © 2020 Mariami. All rights reserved.
//

#import "TableViewController.h"
#import "DetailViewController.h"
#import "Programmer.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    programmers = [NSMutableArray arrayWithArray:@[
        [[Programmer alloc] initWithProgrammer:@"Joe" occupation:@"SWIFT" salary:2000 image:@"bart.png"],
        [[Programmer alloc] initWithProgrammer:@"Jane" occupation:@"Java" salary:1000 image:@"holmer.png"],
    ]];
    
    [[self navigationItem] setBackBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil]];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return programmers.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    Programmer *currentProgrammer = programmers[indexPath.row];
    
    cell.cellTitle.text =currentProgrammer.name;
    cell.occupation.text = currentProgrammer.occupation;
    cell.imageView.image = [UIImage imageNamed:currentProgrammer.image];
    
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [programmers removeObjectAtIndex:[indexPath row]];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
   } else if (editingStyle == UITableViewCellEditingStyleInsert) {
       [tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}


#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.

    if([[segue identifier] isEqualToString:@"showDetail"]){
        DetailViewController *detailView = [segue destinationViewController];
        NSIndexPath *myIndexPath =[self.tableView indexPathForSelectedRow];
        int row =(int) [myIndexPath row];
        detailView.programmer= programmers[row];
    }
}

- (Programmer *)generateNewProgramer:( NSArray *)fields {
       NSString *name=[fields[0] text];
       NSString *occupation = [fields[1] text];
       NSString *salaryString = [fields[2] text];
       int salary=[salaryString intValue];
       Programmer * newProgrammer =[[Programmer alloc] initWithProgrammer:name occupation:occupation salary:salary image:@"bart.png"];
        return newProgrammer;

}


- (IBAction)showModal:(id)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Add programmer" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Name";
    }];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
         textField.placeholder = @"Occupation";
     ;
     }];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
          textField.placeholder = @"Salary";
      }];
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSArray *fields =[alertController textFields];
        Programmer * newProgrammer =[self generateNewProgramer:fields];
        [self->programmers addObject:newProgrammer];
        NSIndexPath *rowIndex = [NSIndexPath indexPathForRow:self->programmers.count-1 inSection:0] ;
        [self tableView:self.tableView commitEditingStyle:UITableViewCellEditingStyleInsert forRowAtIndexPath:rowIndex];
    
    }];
    
    [alertController addAction:confirmAction];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {}];
    [alertController addAction:cancelAction];
    [self presentViewController:alertController animated:YES completion:nil];
}
@end
