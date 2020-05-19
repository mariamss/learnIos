//
//  Programmer.h
//  learnIos
//
//  Created by Mariami on 5/20/20.
//  Copyright © 2020 Mariami. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface Programmer : NSObject

@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSString *occupation;
@property(nonatomic, strong) NSString *image;
@property int salary;

-(id)initWithProgrammer:(NSString *)name
                occupation:(NSString*)occupation
                salary:(int)salary
                image:(NSString*)image;

@end
