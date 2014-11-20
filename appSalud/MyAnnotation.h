//
//  MyAnnotation.h
//  appSalud
//
//  Created by Christopher Hardy on 10/24/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MyAnnotation : NSObject{
    
    CLLocationCoordinate2D coordinate;
    
    NSString *title;
    
    NSString *subTitle;
    
    NSString *time;
    
}

@property (nonatomic)CLLocationCoordinate2D coordinate;

@property (nonatomic, retain) NSString *title;

@property (nonatomic, retain) NSString *subTitle;

@property (nonatomic,retain) NSString *time;

-(id)initWithCoordinate:(CLLocationCoordinate2D) c title:(NSString *) t subTitle:(NSString *)timed time:(NSString *)tim;

-(id)initWithCoordinate:(CLLocationCoordinate2D) c title:(NSString *)tit;

@end