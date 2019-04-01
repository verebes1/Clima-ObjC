//
//  ChangeCityViewController.h
//  Clima-ObjC
//
//  Created by verebes on 01/04/2019.
//  Copyright © 2019 A&D Progress. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ChangeCityDelegate <NSObject>
//- (void)userEnteredANewCityName:(UIViewController *)controller cityName:(NSString *)city;
- (void)userEnteredANewCityName:(NSString *)city;

@end

@interface ChangeCityViewController : UIViewController

@property (nonatomic, weak) id <ChangeCityDelegate> delegate;

@end

