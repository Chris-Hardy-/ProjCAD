//
//  CustomAnnotation.m
//  appSalud
//
//  Created by Christopher Hardy on 11/21/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import "CustomAnnotation.h"

@implementation CustomAnnotation

@synthesize latitud=_latitud;
@synthesize longitud=_longitud;
@synthesize nombre=_nombre;
@synthesize tipo=_tipo;
@synthesize direccion=_direccion;
@synthesize telefono=_telefono;

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.latitud = [decoder decodeDoubleForKey:@"latitud"];
    self.longitud = [decoder decodeDoubleForKey:@"longitud"];
    self.nombre = [decoder decodeObjectForKey:@"nombre"];
    self.tipo = [decoder decodeObjectForKey:@"tipo"];
    self.telefono = [decoder decodeObjectForKey:@"telefono"];
    self.direccion = [decoder decodeObjectForKey:@"direccion"];

    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeDouble:self.latitud forKey:@"latitud"];
    [encoder encodeDouble:self.longitud forKey:@"longitud"];
    [encoder encodeObject:self.nombre forKey:@"nombre"];
    [encoder encodeObject:self.telefono forKey:@"telefono"];
    [encoder encodeObject:self.tipo forKey:@"tipo"];
    [encoder encodeObject:self.direccion forKey:@"direccion"];
}

-(id)initWithTitle:(NSString *)newTitle Location:(CLLocationCoordinate2D)location
{
    self = [super init];
    if (self) {
        _title = newTitle;
        _coordinate = location;
    }
    return self;
}

-(MKAnnotationView *)annotationView
{
    MKAnnotationView *annotationView = [[MKAnnotationView alloc] initWithAnnotation:self reuseIdentifier:@"MyCustomAnnotatio"];
    
    annotationView.enabled = YES;
    annotationView.canShowCallout = YES;
    annotationView.image = [UIImage imageNamed:@"park_icon"];
    annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    
    return annotationView;
}


@end
