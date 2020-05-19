//
//  DetailViewController.h
//  learnIos
//
//  Created by Mariami on 5/19/20.
//  Copyright © 2020 Mariami. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Programmer.h"
NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController

@property(strong,nonatomic) Programmer *programmer;
@property (weak, nonatomic) IBOutlet UIImageView *detailImage;
@property (weak, nonatomic) IBOutlet UILabel *detailTitle;
@property (weak, nonatomic) IBOutlet UILabel *detailOccupation;
@property (weak, nonatomic) IBOutlet UILabel *detailSalary;

@end

NS_ASSUME_NONNULL_END
