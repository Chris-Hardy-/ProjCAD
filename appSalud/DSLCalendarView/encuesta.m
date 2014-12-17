//
//  encuesta.m
//  appSalud
//
//  Created by Christopher Hardy on 12/15/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import "encuesta.h"

@implementation encuesta

@synthesize arrayPreguntas=_arrayPreguntas;
@synthesize idEncuesta=_idEncuesta;
@synthesize nombre=_nombre;
@synthesize arrayData=_arrayData;

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    
    self.arrayPreguntas = [decoder decodeObjectForKey:@"arrayPreguntas"];
    self.idEncuesta = [decoder decodeObjectForKey:@"idEncuesta"];
    self.nombre = [decoder decodeObjectForKey:@"nombre"];
    self.arrayData = [decoder decodeObjectForKey:@"arrayData"];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.arrayPreguntas forKey:@"arrayPreguntas"];
    [encoder encodeObject:self.idEncuesta forKey:@"idEncuesta"];
    [encoder encodeObject:self.nombre forKey:@"nombre"];
    [encoder encodeObject:self.arrayData forKey:@"arrayData"];
}


@end
