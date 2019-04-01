//
//  ChangeCityViewController.m
//  Clima-ObjC
//
//  Created by verebes on 01/04/2019.
//  Copyright © 2019 A&D Progress. All rights reserved.
//

#import "ChangeCityViewController.h"

@interface ChangeCityViewController ()
@property (weak, nonatomic) IBOutlet UITextField *cityNameTextField;


@end

@implementation ChangeCityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)backButtonTapped:(UIButton *)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

- (IBAction)getWeatherTapped:(UIButton *)sender {
//    [self.delegate userEnteredANewCityName:self cityName:self.cityNameTextField.text];
    [self.delegate userEnteredANewCityName:self.cityNameTextField.text];
    [self dismissViewControllerAnimated:true completion:nil];
}


@end
