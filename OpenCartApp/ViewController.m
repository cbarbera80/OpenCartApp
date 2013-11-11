//
//  ViewController.m
//  OpenCartApp
//
//  Created by claudio barbera on 09/11/13.
//  Copyright (c) 2013 Claudio Barbera. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "Categoria.h"

@implementation ViewController
@synthesize  categorie;

- (void)viewDidLoad
{
    
    categorie = [[NSMutableArray alloc] init];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [ApplicationDelegate.dataEngine fetchCategoriesOnSucceeded:^(NSMutableArray *listOfObjects) {
        
        [categorie addObjectsFromArray:listOfObjects];
        [self.tableView reloadData];
    } onError:^(NSError *engineError) {
        
        
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return [categorie count];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"categoryCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    Categoria *c = [categorie objectAtIndex:indexPath.row];
    UILabel *lblName = (UILabel *)[cell viewWithTag:1];
    
    [lblName setText:c.name];
    
    return cell;

}

@end
