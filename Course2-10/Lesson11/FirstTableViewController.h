//
//  FirstTableViewController.h
//  Lesson11
//
//  Created by Ри on 24.02.15.
//  Copyright © 2015 Azat Almeev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Data.h"

@interface FirstTableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic) NSMutableArray *array;
@property(nonatomic,weak)Data *MyData;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *total;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *phones;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *allData;

-(void)addNewObject;
@end
