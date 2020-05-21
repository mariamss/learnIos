//
//  TableViewController.h
//  learnIos
//
//  Created by Mariami on 5/19/20.
//  Copyright © 2020 Mariami. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewCell.h"
#import "Programmer.h"
#include "ModalViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface TableViewController : UITableViewController {
    NSMutableArray<Programmer *> *programmers;
}
- (IBAction)showModal:(id)sender;
@end

NS_ASSUME_NONNULL_END
