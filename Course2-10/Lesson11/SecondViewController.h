//
//  SecondViewController.h
//  Lesson11
//
//  Created by Ри on 24.02.15.
//  Copyright © 2015 Azat Almeev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Data.h"
#import "FirstTableViewController.h"
@class FirstTableViewController;

@interface SecondViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *name;
@property (strong, nonatomic) IBOutlet UITextField *surname;
@property (strong, nonatomic) IBOutlet UITextField *phone;
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong,nonatomic)NSString *ImageName;
@property (weak,nonatomic) Data *data;
@property (weak , nonatomic) FirstTableViewController *controller;
@property (nonatomic)int k;
@property (nonatomic)int index;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *CallButton;
@property (strong, nonatomic) IBOutlet UINavigationItem *NavigationTitle;

@end
