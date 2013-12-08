//
//  RJCurrencySelectionTableViewController.h
//  CurrencyConversion
//
//  Created by Roderic on 12/8/13.
//  Copyright (c) 2013 Roderic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RJCurrencySelectionTableViewController : UITableViewController
@property (nonatomic) NSArray *currencies;
@property(copy)void(^selectionMadeBlock)(NSUInteger);

@end
