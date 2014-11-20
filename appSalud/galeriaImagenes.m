//
//  galeriaImagenes.m
//  appSalud
//
//  Created by Christopher Hardy on 8/28/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import "galeriaImagenes.h"

@implementation galeriaImagenes

@synthesize urlImagen=_urlImagen;
@synthesize imagen=_imagen;
@synthesize titulo=_titulo;

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.urlImagen = [decoder decodeObjectForKey:@"urlImagen"];
    self.imagen = [decoder decodeObjectForKey:@"imagen"];
    self.titulo = [decoder decodeObjectForKey:@"titulo"];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.urlImagen forKey:@"urlImagen"];
    [encoder encodeObject:self.imagen forKey:@"imagen"];
    [encoder encodeObject:self.titulo forKey:@"titulo"];
}

@end
