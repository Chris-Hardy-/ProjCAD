//
//  evento.m
//  appSalud
//
//  Created by Christopher Hardy on 12/15/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import "evento.h"

@implementation evento
@synthesize titulo=_titulo;
@synthesize descripcion=_descripcion;
@synthesize fecha=_fecha;

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.titulo = [decoder decodeObjectForKey:@"titulo"];
    self.descripcion = [decoder decodeObjectForKey:@"descripcion"];
    self.fecha = [decoder decodeObjectForKey:@"fecha"];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.titulo forKey:@"titulo"];
    [encoder encodeObject:self.descripcion forKey:@"descripcion"];
    [encoder encodeObject:self.fecha forKey:@"fecha"];
}



@end
