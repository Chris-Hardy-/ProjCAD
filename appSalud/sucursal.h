//
//  sucursal.h
//  appSalud
//
//  Created by Christopher Hardy on 10/23/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface sucursal : NSObject <NSCoding>

@property (nonatomic, assign) float latitud;
@property (nonatomic, assign) float longitud;
@property (nonatomic, copy) NSString *nombre;
@property (nonatomic, copy) NSString *tipo;
@property (nonatomic, copy) NSString *direccion;
@property (nonatomic, copy) NSString *telefono;
@property (nonatomic, assign) CLLocationCoordinate2D *coordinate;

@end
