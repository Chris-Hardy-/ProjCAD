//
//  MyAnnotation.m
//  appSalud
//
//  Created by Christopher Hardy on 10/24/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import "MyAnnotation.h"

@implementation MyAnnotation

@synthesize coordinate;

@synthesize title;

@synthesize time;

@synthesize subTitle;

-(id)initWithCoordinate:(CLLocationCoordinate2D) c title:(NSString *) t subTitle:(NSString *)timed time:(NSString *)tim

{
    
    self.coordinate=c;
    
    self.time=tim;
    
    self.subTitle=timed;
    
    self.title=t;
    
    return self;
    
}

-(id)initWithCoordinate:(CLLocationCoordinate2D) c title:(NSString *)tit

{
    
    self.coordinate=c;
    
    self.title=tit;
    
    return self;
    
}

@end
