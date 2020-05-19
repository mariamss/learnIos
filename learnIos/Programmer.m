//
//  Programmer.m
//  learnIos
//
//  Created by Mariami on 5/20/20.
//  Copyright © 2020 Mariami. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Programmer.h"

@implementation Programmer

-(id)initWithProgrammer:(NSString *)name occupation:(NSString *)occupation salary:(int)salary  {
    self.name = name;
    self.occupation = occupation;
    self.salary = salary;
    return self;
}
@end
