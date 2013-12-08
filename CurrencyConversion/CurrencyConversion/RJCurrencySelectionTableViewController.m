//
//  RJCurrencySelectionTableViewController.m
//  CurrencyConversion
//
//  Created by Roderic on 12/8/13.
//  Copyright (c) 2013 Roderic. All rights reserved.
//

#import "RJCurrencySelectionTableViewController.h"

@interface RJCurrencySelectionTableViewController ()
@end

@implementation RJCurrencySelectionTableViewController


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.currencies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // Configure the cell...
    cell.textLabel.text = [self.currencies objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"selected %@", [self.currencies objectAtIndex:indexPath.row]);

    // Double check to see that we've got a block to call, then call it
    if (self.selectionMadeBlock) {
        self.selectionMadeBlock(indexPath.row);
    }
}

@end
