//
//  sucursal.m
//  appSalud
//
//  Created by Christopher Hardy on 10/23/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import "sucursal.h"

@implementation sucursal

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
    
    self.latitud = [decoder decodeFloatForKey:@"latitud"];
    self.longitud = [decoder decodeFloatForKey:@"longitud"];
    self.nombre = [decoder decodeObjectForKey:@"nombre"];
    self.tipo = [decoder decodeObjectForKey:@"tipo"];
    self.telefono = [decoder decodeObjectForKey:@"telefono"];
    self.direccion = [decoder decodeObjectForKey:@"direccion"];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeFloat:self.latitud forKey:@"latitud"];
    [encoder encodeFloat:self.longitud forKey:@"longitud"];
    [encoder encodeObject:self.nombre forKey:@"nombre"];
    [encoder encodeObject:self.telefono forKey:@"telefono"];
    [encoder encodeObject:self.tipo forKey:@"tipo"];
    [encoder encodeObject:self.direccion forKey:@"direccion"];
}



@end
