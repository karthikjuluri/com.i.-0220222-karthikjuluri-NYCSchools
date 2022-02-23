//
//  Utilities.m
//  20220222-karthikjuluri-NYCSchools
//
//  Created by karthik on 2/22/22.
//

#import "Utilities.h"

@implementation Utilities
+ (UIAlertController *)getAlertController:(NSString *)message{
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@""
                                                        message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(10, 5, 50, 50)];
    
    indicator.hidesWhenStopped = YES;
    [indicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    
    [indicator startAnimating];
    [[alert view] addSubview: indicator];
    
    return alert;
}
@end
