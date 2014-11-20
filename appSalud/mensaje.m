//
//  mensaje.m
//  appSalud
//
//  Created by Christopher Hardy on 8/28/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import "mensaje.h"

@implementation mensaje

@synthesize mensaje=_mensaje;
@synthesize nombre=_nombre;
@synthesize apellidos=_apellidos;
@synthesize urlImagen=_urlImagen;
@synthesize imagenPerfil=_imagenPerfil;
@synthesize latitud=_latitud;
@synthesize longitud=_longitud;

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.mensaje = [decoder decodeObjectForKey:@"mensaje"];
    self.nombre = [decoder decodeObjectForKey:@"nombre"];
    self.apellidos = [decoder decodeObjectForKey:@"apellidos"];
    self.urlImagen = [decoder decodeObjectForKey:@"urlImagen"];
    self.imagenPerfil = [decoder decodeObjectForKey:@"imagenPerfil"];
    self.latitud = [decoder decodeFloatForKey:@"latitud"];
    self.longitud = [decoder decodeFloatForKey:@"longitud"];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.mensaje forKey:@"mensaje"];
    [encoder encodeObject:self.nombre forKey:@"nombre"];
    [encoder encodeObject:self.apellidos forKey:@"apellidos"];
    [encoder encodeObject:self.urlImagen forKey:@"urlImagen"];
    [encoder encodeObject:self.imagenPerfil forKey:@"imagenPerfil"];
    [encoder encodeFloat:self.latitud forKey:@"latitud"];
    [encoder encodeFloat:self.longitud forKey:@"longitud"];
}

@end
