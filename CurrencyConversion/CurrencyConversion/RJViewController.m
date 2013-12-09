//
//  RJViewController.m
//  CurrencyConversion
//
//  Created by Roderic on 12/7/13.
//  Copyright (c) 2013 Roderic. All rights reserved.
//

#import "RJViewController.h"
#import "RJCurrencySelectionTableViewController.h"


// The default information, We can refresh this from the app
#define kAPIResponse @"{ \"disclaimer\": \"Exchange rates are provided for informational purposes only, and do not constitute financial advice of any kind. Although every attempt is made to ensure quality, NO guarantees are given whatsoever of accuracy, validity, availability, or fitness for any purpose - please use at your own risk. All usage is subject to your acceptance of the Terms and Conditions of Service, available at: https://openexchangerates.org/terms/\", \"license\": \"Data sourced from various providers with public-facing APIs; copyright may apply; resale is prohibited; no warranties given of any kind. Bitcoin data provided by http://coindesk.com. All usage is subject to your acceptance of the License Agreement available at: https://openexchangerates.org/license/\", \"timestamp\": 1386439261, \"base\": \"USD\", \"rates\": { \"AED\": 3.672758, \"AFN\": 58.195, \"ALL\": 102.5234, \"AMD\": 410.638, \"ANG\": 1.78892, \"AOA\": 97.544001, \"ARS\": 6.238741, \"AUD\": 1.098667, \"AWG\": 1.79005, \"AZN\": 0.784133, \"BAM\": 1.428728, \"BBD\": 2, \"BDT\": 77.55601, \"BGN\": 1.429622, \"BHD\": 0.37698, \"BIF\": 1543.716767, \"BMD\": 1, \"BND\": 1.250407, \"BOB\": 6.911914, \"BRL\": 2.333128, \"BSD\": 1, \"BTC\": 0.0013253298, \"BTN\": 61.539713, \"BWP\": 8.735265, \"BYR\": 9412.421667, \"BZD\": 1.991726, \"CAD\": 1.064293, \"CDF\": 922.713, \"CHF\": 0.892746, \"CLF\": 0.02262, \"CLP\": 526.1322, \"CNY\": 6.090196, \"COP\": 1933.683317, \"CRC\": 497.777401, \"CUP\": 22.687419, \"CVE\": 80.58435, \"CZK\": 20.04785, \"DJF\": 177.841, \"DKK\": 5.445803, \"DOP\": 42.43876, \"DZD\": 79.419739, \"EEK\": 11.653925, \"EGP\": 6.887122, \"ERN\": 15.0122, \"ETB\": 19.06139, \"EUR\": 0.729679, \"FJD\": 1.870741, \"FKP\": 0.611683, \"GBP\": 0.611683, \"GEL\": 1.72881, \"GHS\": 2.299916, \"GIP\": 0.611683, \"GMD\": 38.1, \"GNF\": 6959.615, \"GTQ\": 7.857367, \"GYD\": 207.526249, \"HKD\": 7.754421, \"HNL\": 20.49824, \"HRK\": 5.581762, \"HTG\": 38.874088, \"HUF\": 219.468199, \"IDR\": 11933.833333, \"ILS\": 3.503596, \"INR\": 61.29949, \"IQD\": 1163.515041, \"IRR\": 24790.334633, \"ISK\": 118.238, \"JEP\": 0.611683, \"JMD\": 103.555201, \"JOD\": 0.707274, \"JPY\": 102.760599, \"KES\": 86.52894, \"KGS\": 49.291425, \"KHR\": 3986.9935, \"KMF\": 359.20177, \"KPW\": 900, \"KRW\": 1056.966662, \"KWD\": 0.282824, \"KYD\": 0.825461, \"KZT\": 154.060101, \"LAK\": 8005.509935, \"LBP\": 1505.295, \"LKR\": 130.838501, \"LRD\": 80.675699, \"LSL\": 10.36924, \"LTL\": 2.5209, \"LVL\": 0.513115, \"LYD\": 1.236795, \"MAD\": 8.203874, \"MDL\": 12.96044, \"MGA\": 2250.186667, \"MKD\": 45.01098, \"MMK\": 982.2075, \"MNT\": 1713.333333, \"MOP\": 7.977868, \"MRO\": 291.8419, \"MTL\": 0.683602, \"MUR\": 30.29916, \"MVR\": 15.39084, \"MWK\": 411.7839, \"MXN\": 12.95303, \"MYR\": 3.22797, \"MZN\": 29.925, \"NAD\": 10.37174, \"NGN\": 158.2256, \"NIO\": 25.41598, \"NOK\": 6.155156, \"NPR\": 98.407359, \"NZD\": 1.207359, \"OMR\": 0.385002, \"PAB\": 1, \"PEN\": 2.797783, \"PGK\": 2.517959, \"PHP\": 43.96151, \"PKR\": 108.31484, \"PLN\": 3.056548, \"PYG\": 4470.481634, \"QAR\": 3.641034, \"RON\": 3.253542, \"RSD\": 84.01048, \"RUB\": 32.77614, \"RWF\": 670.98942, \"SAR\": 3.750298, \"SBD\": 7.211283, \"SCR\": 12.01571, \"SDG\": 5.69506, \"SEK\": 6.505033, \"SGD\": 1.250129, \"SHP\": 0.611683, \"SLL\": 4336, \"SOS\": 1193.5917, \"SRD\": 3.2875, \"STD\": 18030.234, \"SVC\": 8.738118, \"SYP\": 140.281126, \"SZL\": 10.37124, \"THB\": 32.19989, \"TJS\": 4.77365, \"TMT\": 2.85, \"TND\": 1.665034, \"TOP\": 1.858699, \"TRY\": 2.027201, \"TTD\": 6.395571, \"TWD\": 29.59203, \"TZS\": 1603.383333, \"UAH\": 8.207629, \"UGX\": 2523.846667, \"USD\": 1, \"UYU\": 21.28702, \"UZS\": 2172.20514, \"VEF\": 6.293205, \"VND\": 21119.65, \"VUV\": 96.2325, \"WST\": 2.325599, \"XAF\": 479.489442, \"XAG\": 0.05131515, \"XAU\": 0.0008133, \"XCD\": 2.70102, \"XDR\": 0.649961, \"XOF\": 479.19628, \"XPF\": 87.35342, \"YER\": 214.981, \"ZAR\": 10.34294, \"ZMK\": 5252.024745, \"ZMW\": 5.57776, \"ZWL\": 322.355006 } }"


@interface RJViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lastRefreshDate;
@property (nonatomic) NSDictionary *response;
@property (nonatomic) NSArray *currencies;
@property (weak, nonatomic) IBOutlet UITextView *disclaimerTextView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *amountTextField;
@property (nonatomic) float inputValue;
@property (nonatomic) NSNumberFormatter *formatter;
@property (weak, nonatomic) IBOutlet UIButton *currentCurrencyButton;
@property (nonatomic) NSUInteger currentSelection;
@property (nonatomic) NSUInteger baseSelection;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *refreshingRateActivityIndicator;
@end

static NSString *kConstRates = @"rates";
static NSString *kConstDisclaimer = @"disclaimer";
static NSString *kConstLicense = @"license";
static NSString *kConstBaseCurrency = @"USD";

@implementation RJViewController

- (void)updateUIWithLatestResponse {
    self.currencies = [[[self.response valueForKey:kConstRates] allKeys] sortedArrayUsingSelector:@selector(compare:)];
    NSString *disclaimerText = [self.response valueForKey:kConstDisclaimer];
    NSString *licenseText = [self.response valueForKey:kConstLicense];
    self.disclaimerTextView.text = [NSString stringWithFormat:@"%@\n\n%@", disclaimerText, licenseText];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Load the default response. This is data that was imported at compile time. It should be updated. See the UI
    NSError *error = nil;
    self.response = [NSJSONSerialization JSONObjectWithData:[kAPIResponse dataUsingEncoding:NSUTF8StringEncoding] options: NSJSONReadingMutableContainers error: &error];

    [self updateUIWithLatestResponse];
    
    self.formatter = [[NSNumberFormatter alloc] init];
    [self.formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    
    self.currentSelection = [self.currencies indexOfObject:kConstBaseCurrency];
    NSLog(@"current selection is %d", self.currentSelection);
    
    self.lastRefreshDate.text = @"Probably stale rates";

}
#pragma mark - Networking

- (BOOL)errorCheckingResponse:(id)response {
    
    // Some very simple error checking
    
    if (![response isKindOfClass:[NSDictionary class]]) {
        return NO;
    }
    if (![response objectForKey:kConstDisclaimer] || ![response objectForKey:kConstRates]) {
        return NO;
    }
    
    return YES;
}
- (IBAction)refreshRates:(id)sender {
    // TODO implement the network part
    
    NSString *url = @"http://openexchangerates.org/api/latest.json?app_id=6bd9a12c55324eb09b38c6302a02ed73";
    //url = @"https://baconipsum.com/api/?type=all-meat&sentences=1&start-with-lorem=1";
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    [self.refreshingRateActivityIndicator startAnimating];

    __block RJViewController *blockSelf = self;
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)  {
        NSError *error = nil;
        id responseObject =  [NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingMutableContainers error: &error];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (!error && [self errorCheckingResponse:responseObject]) {
                // Update the UI on the main thread if everything checks out
                blockSelf.response = responseObject;
                
                blockSelf.lastRefreshDate.text = [NSString stringWithFormat:@"Refreshed: %@", [NSDate date]];
                [blockSelf updateUIWithLatestResponse];
                [blockSelf reloadVisibleCells];
            } else {
                // Something isn't right. A better display would be ideal here to inform the user that something is wrong
                blockSelf.lastRefreshDate.text = @"Error refreshing rates";
            }
            [blockSelf.refreshingRateActivityIndicator stopAnimating];
        });
        
        
    }];
}


#pragma mark - UITextViewDelegate methods

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    // Some data has been entered into the text view. Let us react to the changes
    
    // return has been entered, dismiss the keyboard
    if ([string rangeOfString:@"\n"].location != NSNotFound) {
        [textField resignFirstResponder];
        return YES;
    }
    
    // Time to calculate the new value to be converted. Store this in self.inputValue
    NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    self.inputValue = [[self.formatter numberFromString:newString] floatValue];

    [self reloadVisibleCells];
    return YES;
}

#pragma mark - UITableViewDataSource and UITableViewDelegate methods
- (void)reloadVisibleCells {
    // Update only the visible cells
    // Do the least amount of work possible
    NSArray *visibleCells = self.tableView.visibleCells;
    NSMutableArray *cellIndexPaths = [[NSMutableArray alloc] initWithCapacity:visibleCells.count];
    for (UITableViewCell *cell in visibleCells) {
        [cellIndexPaths addObject:[self.tableView indexPathForCell:cell]];
    }
    [self.tableView reloadRowsAtIndexPaths:cellIndexPaths withRowAnimation:UITableViewRowAnimationFade];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.currencies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseIdentifier = @"reuse";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier];
    }
    
    NSString *currencyToConvertTo = [self.currencies objectAtIndex:indexPath.row];
    cell.textLabel.text = currencyToConvertTo;
    
    // Get the rate
    NSDictionary *currencyToRates = [self.response valueForKey:kConstRates];
   
    // The currency we are basing off of, default USD
    NSString *currentSelectionKey = [self.currencies objectAtIndex:self.currentSelection];
    NSNumber *referenceRate = [currencyToRates valueForKey:currentSelectionKey];
    
    // The value of the target conversion rate
    NSNumber *targetRate = [currencyToRates valueForKey:currencyToConvertTo];
    
    // All rates are based off of USD, so convert to USD, then target
    float result = [targetRate floatValue] * self.inputValue / [referenceRate floatValue];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%f", result];
    return cell;
}

#pragma mark -
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // There is only one segue
    RJCurrencySelectionTableViewController *viewController = segue.destinationViewController;
    viewController.currencies = self.currencies;

    __block RJViewController *blockSelf = self;
    // Once a different currency is selected, we need to update out reference point and our label
    [viewController setSelectionMadeBlock:^(NSUInteger index) {
        [blockSelf.navigationController popViewControllerAnimated:YES];
        [blockSelf.currentCurrencyButton setTitle:[blockSelf.currencies objectAtIndex:index] forState:UIControlStateNormal];
        blockSelf.currentSelection = index;
        [blockSelf reloadVisibleCells];
    }];
}



@end
