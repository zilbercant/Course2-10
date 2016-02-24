//
//  FirstTableViewController.m
//  Lesson11
//
//  Created by Ри on 24.02.15.
//  Copyright © 2015 Azat Almeev. All rights reserved.
//

#import "FirstTableViewController.h"
#import "Data.h"
#import "SecondViewController.h"
#import "CustomTableViewCell.h"

@interface FirstTableViewController ()

@end

@implementation FirstTableViewController
@synthesize array = _array;

- (void)viewDidLoad {
    [super viewDidLoad];
    _array = [[NSMutableArray alloc]init];
    
   
}

-(void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
    [self showInfo];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Data *data =[_array objectAtIndex:indexPath.row];
    CustomTableViewCell *cell = (CustomTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"MainCell"];
    cell.Name.text = [NSString stringWithFormat:@"%@ %@",data.Name,data.Surname];
    cell.Phone.text = data.Phone;
    cell.Image.image = [UIImage imageNamed:data.ImageName];
    return cell;
}



- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}



- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_array removeObjectAtIndex:indexPath.row];
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

-(void)showInfo{
    self.total.title = [NSString stringWithFormat:@"Total:%ld",self.array.count];
    self.phones.title = [NSString stringWithFormat:@"Phones:%ld",[self getPhonesCount]];
    self.allData.title = [NSString stringWithFormat:@"All data:%ld",[self getAllDataCount]];
}

-(NSInteger *)getPhonesCount{
    int i;
    int j = 0;
    for(i = 0;i<self.array.count;i++){
        Data *data =[_array objectAtIndex:i];
        if(![data.Phone isEqualToString:@""]){
            j++;
        }
    }
    return j;
}

-(NSInteger *)getAllDataCount{
    int i;
    int j = 0;
    for(i = 0;i<self.array.count;i++){
        Data *data =[_array objectAtIndex:i];
        if(![data.Phone isEqualToString:@""] && ![data.Name isEqualToString:@""] && ![data.Surname isEqualToString:@""]){
            j++;
        }
    }
    return j;
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    SecondViewController *vc = [segue destinationViewController];
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    vc.controller = self;
    if([segue.identifier isEqualToString:@"Show"]){
        vc.data = [_array objectAtIndex:indexPath.row];
        vc.index = indexPath.row;
    }else vc.k = 1;
}


@end
