//
//  noticia.m
//  appSalud
//
//  Created by Christopher Hardy on 9/9/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import "noticia.h"

@implementation noticia

@synthesize tituloNoticia=_tituloNoticia;
@synthesize textoNoticia=_textoNoticia;
@synthesize urlNoticia=_urlNoticia;
@synthesize imagenNoticia=_imagenNoticia;
@synthesize urlImagen=_urlImagen;

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    
    self.tituloNoticia = [decoder decodeObjectForKey:@"tituloNoticia"];
    self.textoNoticia = [decoder decodeObjectForKey:@"textoNoticia"];
    self.urlNoticia = [decoder decodeObjectForKey:@"urlNoticia"];
    self.imagenNoticia = [decoder decodeObjectForKey:@"imagenNoticia"];
    self.urlImagen = [decoder decodeObjectForKey:@"urlImagen"];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    
    [encoder encodeObject:self.tituloNoticia forKey:@"tituloNoticia"];
    [encoder encodeObject:self.textoNoticia forKey:@"textoNoticia"];
    [encoder encodeObject:self.urlNoticia forKey:@"urlNoticia"];
    [encoder encodeObject:self.imagenNoticia forKey:@"imagenNoticia"];
    [encoder encodeObject:self.urlImagen forKey:@"urlImagen"];
    
}

@end
