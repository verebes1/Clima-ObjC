//
//  ViewController.m
//  Clima-ObjC
//
//  Created by verebes on 28/03/2019.
//  Copyright © 2019 A&D Progress. All rights reserved.
//

#import "WeatherViewController.h"
#import "WeatherDataModel.h"

@interface WeatherViewController ()
@property (weak, nonatomic) IBOutlet UILabel *tempLabel;
@property (weak, nonatomic) IBOutlet UIImageView *weatherConditionImage;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) WeatherDataModel *weatherDataModel;

@end

@implementation WeatherViewController

//Constants
NSString *WEATHER_URL = @"https://api.openweathermap.org/data/2.5/weather";
//?q=leicester&appid=
NSString *APP_ID = @"";


//TODO: Declare instance variables here

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupLocationManager];
//    [self getWeatherDataFromURL:WEATHER_URL params:APP_ID];
}

- (IBAction)changeCityTapped:(UIButton *)sender {
//    self.cityLabel.text = @"Leicester";
    [self setupLocationManager];
}

//MARK:- LOCATION MANAGER SETUP
- (void)setupLocationManager {

    self.locationManager = CLLocationManager.new;
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager startUpdatingLocation];
}


//MARK: - Networking
/***************************************************************/
- (void)getWeatherDataFromURL:(NSString *)url params:(NSString *)parameters {
//    NSString *urlString = [NSString stringWithFormat:@"%@%@", url, parameters];
//    NSLog(@"GETTING DATA FROM %@", urlString);
//
    NSURLComponents *urlComponents = [NSURLComponents componentsWithString:url];
    urlComponents.query = parameters;
        
    if (urlComponents.URL == nil) {
        return;
    }
    
    [[NSURLSession.sharedSession dataTaskWithURL:urlComponents.URL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (data != nil) {
            NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"JSON String: %@", jsonString);
            
            [self updateWeatherDataWith:data];
        }
    }] resume];
}

//MARK: - JSON Parsing
/***************************************************************/
- (void)updateWeatherDataWith:(NSData *)data {
    NSError *err;
    NSDictionary *weatherDataJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
    if (err) {
        NSLog(@"Failed to serialize into JSON: %@", err.localizedDescription);
        self.cityLabel.text = @"Unable to get weather :(";
        return;
    }
    
//    NSDictionary *mainDict = weatherDataJSON[@"main"];
//    NSNumber *temp = mainDict[@"temp"];
    NSNumber *temp = weatherDataJSON[@"main"][@"temp"];
    NSNumber *weatherID = [weatherDataJSON[@"weather"] firstObject][@"id"];
    NSString *cityName = weatherDataJSON[@"name"];
    
    
    self.weatherDataModel = WeatherDataModel.new;
    self.weatherDataModel.temperature = [NSNumber numberWithDouble:[temp doubleValue] - 273.15];
    self.weatherDataModel.weatherId = weatherID;
    self.weatherDataModel.cityName = cityName;
    NSLog(@"Temp is: %@", self.weatherDataModel.temperature);
    NSLog(@"Weather id is: %@", weatherID);
    [self updateUIWithWeatherData];
    
}

//MARK: - UI Updates
/***************************************************************/
- (void)updateUIWithWeatherData {
    if (self.weatherDataModel != nil) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSNumberFormatter *formatter = NSNumberFormatter.new;
            [formatter setPositiveFormat:@"0°"];
            NSString *weatherImageName = [self.weatherDataModel updateWeatherIcon:[self.weatherDataModel weatherId]];
            self.tempLabel.text = [formatter stringFromNumber: self.weatherDataModel.temperature];
            self.cityLabel.text = self.weatherDataModel.cityName;
            self.weatherConditionImage.image = [UIImage imageNamed:weatherImageName];
        });
    }
}

//MARK: - Location Manager Delegate Methods
/***************************************************************/

//didUpdateLocations method:
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    CLLocation *location = locations[locations.count - 1];
    if (location.horizontalAccuracy > 0) {
        [self.locationManager stopUpdatingLocation];
        self.locationManager.delegate = nil;
        NSString *latitude = [NSString stringWithFormat:@"%f", location.coordinate.latitude];
        NSString *longitude = [NSString stringWithFormat:@"%F", location.coordinate.longitude];
        NSString *params = [NSString stringWithFormat:@"lat=%@&lon=%@&appid=%@", latitude, longitude, APP_ID];
        [self getWeatherDataFromURL:WEATHER_URL params:params];
    }
}

 //didFailWithError method:
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"%@", error.localizedDescription);
    self.cityLabel.text = @"Location unavailable!";
}

//MARK: - Change City Delegate methods
/***************************************************************/

//userEnteredANewCityName Delegate method:




//MARK: - Prepare for segue method


@end
