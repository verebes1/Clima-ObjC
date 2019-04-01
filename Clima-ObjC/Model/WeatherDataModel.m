//
//  WeatherDataModel.m
//  Clima-ObjC
//
//  Created by verebes on 30/03/2019.
//  Copyright © 2019 A&D Progress. All rights reserved.
//

#import "WeatherDataModel.h"

@implementation WeatherDataModel


- (NSString *)updateWeatherIcon:(NSNumber *)condition {
    
    switch ([condition intValue]) {
        case 0 ... 300 :
            return @"tstorm1";
            break;
        case 301 ... 500 :
            return @"light_rain";
            break;
        case 501 ... 600 :
            return @"shower3";
            break;
        case 601 ... 700 :
            return @"snow4";
            break;
        case 701 ... 771 :
            return @"fog";
            break;
        case 772 ... 799 :
            return @"tstorm3";
            break;
        case 800 :
            return @"sunny";
            break;
        case 801 ... 804 :
            return @"cloudy2";
            break;
        case 900 ... 902:
        case 905 ... 1000:
            return @"tstorm3";
            break;
        case 903 :
            return @"snow5";
            break;
        case 904 :
            return @"sunny";
            break;
        default :
            return @"dunno";
            break;
    }
    
}

@end
