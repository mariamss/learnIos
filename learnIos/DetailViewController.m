//
//  DetailViewController.m
//  learnIos
//
//  Created by Mariami on 5/19/20.
//  Copyright © 2020 Mariami. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = self.programmer.name;
    self.detailTitle.text = self.programmer.name;
    self.detailOccupation.text= self.programmer.occupation;
    NSString* salaryString = [NSString stringWithFormat:@"%i", self.programmer.salary];
    self.detailSalary.text = salaryString;
    self.detailImage.image = [UIImage imageNamed:self.programmer.image];
    
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
