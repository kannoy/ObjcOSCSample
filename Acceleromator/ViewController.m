//
//  ViewController.m
//  Acceleromator
//
//  Created by Masamichi Ueta on 12/07/17.
//  Copyright (c) 2012年 The University of Tokyo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize xaccel;
@synthesize yaccel;
@synthesize zaccel;
@synthesize degree1;
@synthesize degree2;
@synthesize degree3;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    UIAccelerometer *accel = [UIAccelerometer sharedAccelerometer];
    accel.delegate = self;
    accel.updateInterval = 1.0f / 10.0f; 
    
    port = [OSCPort oscPortToAddress:"192.168.0.8"  portNumber: 7000];
    
}

- (void)viewDidUnload
{
    [self setXaccel:nil];
    [self setYaccel:nil];
    [self setZaccel:nil];
    [self setDegree1:nil];
    [self setDegree2:nil];
    [self setDegree3:nil];
    [super viewDidUnload];
    UIAccelerometer *accel = [UIAccelerometer sharedAccelerometer];
    accel.delegate = nil;

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}


- (void)accelerometer:(UIAccelerometer *)acel 
        didAccelerate:(UIAcceleration *)acceleration {
    
    xaccel.text = [NSString stringWithFormat:@"%f", acceleration.x];
    yaccel.text = [NSString stringWithFormat:@"%f", acceleration.y];
    zaccel.text = [NSString stringWithFormat:@"%f", acceleration.z];
    
    
    double degreeyz = -atan2(acceleration.y, acceleration.z) * 180.0 / M_PI;
    double degreezx = atan2(acceleration.x, acceleration.z) * 180.0 / M_PI;
    double degreeyx = atan2(acceleration.y, acceleration.x) * 180.0 / M_PI;
    
    degree1.text = [NSString stringWithFormat:@"%f",degreeyz];
    degree2.text = [NSString stringWithFormat:@"%f",degreezx];
    degree3.text = [NSString stringWithFormat:@"%f",degreeyx];
    
    [port sendTo:"/degree1" types:"f", degreeyz];
    [port sendTo:"/degree2" types:"f", degreezx];
    [port sendTo:"/degree3" types:"f", degreeyx];
    
}



@end
