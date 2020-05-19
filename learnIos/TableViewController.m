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
    title = @[@"John", @"Jane",@"Joe"];
    occupation =@[@"Java", @"Swift", @"JS"];
    salary = @[@"1000",@"1000", @"1000"];
    image = @[@"bart.png",@"bart.png",@"bart.png"];
    programmers = @[
    [[Programmer alloc] initWithProgrammer:@"programmer 1" occupation:@"test" salary:1000],
    [[Programmer alloc] initWithProgrammer:@"programmer 2" occupation:@"efwf" salary:1000]
    ];
 
    
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
    cell.cellTitle.text =programmers[indexPath.row].name;
    cell.occupation.text = programmers[indexPath.row].occupation;
    cell.imageView.image = [UIImage imageNamed:image[indexPath.row]];
        // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([[segue identifier] isEqualToString:@"showDetail"]){
        DetailViewController *detailView = [segue destinationViewController];
        NSIndexPath *myIndexPath =[self.tableView indexPathForSelectedRow];
        
        int row =(int) [myIndexPath row];
        detailView.detailModal= @[title[row],occupation[row],salary[row], image[row]];
    }
}


@end
