//
//  WeatherDataModel.h
//  Clima-ObjC
//
//  Created by verebes on 30/03/2019.
//  Copyright © 2019 A&D Progress. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WeatherDataModel : NSObject

//@property (nonatomic, strong) NSString *name;
//@property (nonatomic, strong) NSNumber *numberOfLessons;
@property (nonatomic, strong) NSNumber *temperature;
@property (nonatomic, strong) NSString *cityName;
@property (nonatomic, strong) NSNumber *weatherId;

- (NSString *)updateWeatherIcon:(NSNumber *)condition;

@end

NS_ASSUME_NONNULL_END
