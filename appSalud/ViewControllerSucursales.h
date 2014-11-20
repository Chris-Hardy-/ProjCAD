//
//  ViewControllerSucursales.h
//  appSalud
//
//  Created by Christopher Hardy on 10/24/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface ViewControllerSucursales : UIViewController <MKMapViewDelegate>


@property (weak, nonatomic) IBOutlet MKMapView *mapSurcursales;
@property (nonatomic, retain) CLLocation* initialLocation;

@end


