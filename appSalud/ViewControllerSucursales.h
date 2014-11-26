//
//  ViewControllerSucursales.h
//  appSalud
//
//  Created by Christopher Hardy on 10/24/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "CalloutMapAnnotation.h"


@interface ViewControllerSucursales : UIViewController <MKMapViewDelegate>{
    //CalloutMapAnnotation *_calloutAnnotation;
}


@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic, retain) CLLocation* initialLocation;
@property (nonatomic, retain) MKAnnotationView *selectedAnnotationView;


@end


