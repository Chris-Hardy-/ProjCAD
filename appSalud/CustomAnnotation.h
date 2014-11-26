//
//  CustomAnnotation.h
//  appSalud
//
//  Created by Christopher Hardy on 11/21/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface CustomAnnotation : NSObject <MKAnnotation, NSCoding>

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (copy, nonatomic) NSString *title;


@property (copy, nonatomic) NSString *nombre;
@property (nonatomic) double latitud;
@property (nonatomic) double longitud;
@property (copy, nonatomic) NSString *tipo;
@property (copy, nonatomic) NSString *telefono;
@property (copy, nonatomic) NSString *direccion;


- (id)initWithTitle:(NSString *)newTitle Location:(CLLocationCoordinate2D)location;
- (MKAnnotationView *)annotationView;




@end
