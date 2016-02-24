//
//  SecondViewController.m
//  Lesson11
//
//  Created by Ри on 24.02.15.
//  Copyright © 2015 Azat Almeev. All rights reserved.
//

#import "SecondViewController.h"
#import "FirstTableViewController.h"
#import "Data.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    
}
- (IBAction)ImageClicked:(id)sender {
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"Select Image" message:@"Select image for your profile" preferredStyle:UIAlertControllerStyleActionSheet];
    [alert addAction:[UIAlertAction actionWithTitle:@"Panda" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action){
        self.ImageName = @"1.jpg";
        self.image.image = [UIImage imageNamed:self.ImageName];
        
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"Xmas three" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action){
        self.ImageName = @"2.png";
        self.image.image = [UIImage imageNamed:self.ImageName];

    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"Car" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action){
        self.ImageName = @"3.jpg";
        self.image.image = [UIImage imageNamed:self.ImageName];

    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"Delete" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *_Nonnull action){
        self.ImageName = nil;
        self.image.image = nil;
        
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];


    [self presentViewController:alert animated:YES completion:nil];
}
- (IBAction)CallButton:(id)sender {
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"Call" message:self.phone.text preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"Call" style:UIAlertActionStyleDefault handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
}


-(void)viewWillDisappear:(BOOL)animated{
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    Data *newData = [[Data alloc]init:self.name.text Surname:self.surname.text Phone:self.phone.text ImageName:self.ImageName];
    if(self.k == 1){
        arr = self.controller.array;
        [arr addObject:newData];
        self.controller.array = arr;
        arr = nil;
        self.k = 0;
    }else{
        arr = self.controller.array;
        [arr removeObjectAtIndex:self.index];
//        if( [self.ImageName isEqualToString:newData.ImageName])
        [arr insertObject:newData atIndex:self.index];
        self.controller.array = arr;
        arr = nil;
    }
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)viewWillAppear:(BOOL)animated{
    if(self.data){
        self.name.text = self.data.Name;
        self.surname.text = self.data.Surname;
        self.phone.text = self.data.Phone;
        self.image.image = [UIImage imageNamed:self.data.ImageName];
        self.ImageName = self.data.ImageName;
    }
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged:) name:UITextFieldTextDidChangeNotification object:self.name];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged:) name:UITextFieldTextDidChangeNotification object:self.surname];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(phoneNotification:) name:UITextFieldTextDidChangeNotification object:self.phone];
    

}


-(void)textChanged:(NSNotification *)notify{
    self.NavigationTitle.title = [NSString stringWithFormat:@"%@ %@",self.name.text,self.surname.text];
    
}

-(void)phoneNotification:(NSNotification *)notify{
    if(self.phone.text.length >5){
        [self.CallButton setEnabled:YES];
    }else [self.CallButton setEnabled:NO];
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
