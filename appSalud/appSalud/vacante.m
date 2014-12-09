//
//  vacante.m
//  appSalud
//
//  Created by Dulce Beatriz Godinez Guerrero on 28/11/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import "vacante.h"

@implementation vacante

@synthesize bolsaTrabajo=_bolsaTrabajo;
@synthesize fecPublicacion=_fecPublicacion;
@synthesize lugar=_lugar;
@synthesize sueldo=_sueldo;
@synthesize perfil=_perfil;

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    
    self.bolsaTrabajo = [decoder decodeObjectForKey:@"bolsaTrabajo"];
    self.fecPublicacion = [decoder decodeObjectForKey:@"fecPublicacion"];
    self.lugar = [decoder decodeObjectForKey:@"lugar"];
    self.sueldo= [decoder decodeFloatForKey:@"sueldo"];
    self.perfil = [decoder decodeObjectForKey:@"perfil"];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.bolsaTrabajo forKey:@"bolsaTrabajo"];
    [encoder encodeObject:self.fecPublicacion forKey:@"fecPublicacion"];
    [encoder encodeObject:self.lugar forKey:@"lugar"];
    [encoder encodeFloat:self.sueldo forKey:@"sueldo"];
    [encoder encodeObject:self.perfil forKey:@"perfil"];
    }


@end