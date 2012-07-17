//
//  ViewController.h
//  Acceleromator
//
//  Created by Masamichi Ueta on 12/07/17.
//  Copyright (c) 2012年 The University of Tokyo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OSCPort.h"

@interface ViewController : UIViewController<UIAccelerometerDelegate>{

    OSCPort* port;
    
}
@property (strong, nonatomic) IBOutlet UILabel *xaccel;
@property (strong, nonatomic) IBOutlet UILabel *yaccel;
@property (strong, nonatomic) IBOutlet UILabel *zaccel;
@property (strong, nonatomic) IBOutlet UILabel *degree1;
@property (strong, nonatomic) IBOutlet UILabel *degree2;
@property (strong, nonatomic) IBOutlet UILabel *degree3;


@end
