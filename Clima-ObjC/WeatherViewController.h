//
//  ViewController.h
//  Clima-ObjC
//
//  Created by verebes on 28/03/2019.
//  Copyright © 2019 A&D Progress. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface WeatherViewController : UIViewController<CLLocationManagerDelegate>
- (void)getWeatherDataFromURL:(NSString *)url params:(NSString *)parameters;

@end

