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
NS_ASSUME_NONNULL_BEGIN

@interface TableViewController : UITableViewController {
    NSArray<Programmer *> *programmers;

    
}

@end

NS_ASSUME_NONNULL_END
