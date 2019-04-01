//
//  ViewController.h
//  Clima-ObjC
//
//  Created by verebes on 28/03/2019.
//  Copyright © 2019 A&D Progress. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "ChangeCityViewController.h"

@interface WeatherViewController : UIViewController<CLLocationManagerDelegate, ChangeCityDelegate>
- (void)getWeatherDataFromURL:(NSString *)url params:(NSString *)parameters;

@end

