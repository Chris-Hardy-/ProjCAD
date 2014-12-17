//
//  vacante.m
//  appSalud
//
//  Created by Dulce Beatriz Godinez Guerrero on 28/11/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import "vacante.h"

@implementation vacante

@synthesize nombreBolsaTrabajo=_nombreBolsaTrabajo;
@synthesize fecPublicacion=_fecPublicacion;
@synthesize lugar=_lugar;
@synthesize sueldo=_sueldo;
@synthesize perfil=_perfil;
@synthesize idBolsaTrabajo=_idBolsaTrabajo;

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    
    self.nombreBolsaTrabajo = [decoder decodeObjectForKey:@"nombreBolsaTrabajo"];
    self.fecPublicacion = [decoder decodeObjectForKey:@"fecPublicacion"];
    self.lugar = [decoder decodeObjectForKey:@"lugar"];
    self.sueldo= [decoder decodeObjectForKey:@"sueldo"];
    self.perfil = [decoder decodeObjectForKey:@"perfil"];
    self.idBolsaTrabajo = [decoder decodeObjectForKey:@"idBolsaTrabajo"];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.nombreBolsaTrabajo forKey:@"nombreBolsaTrabajo"];
    [encoder encodeObject:self.fecPublicacion forKey:@"fecPublicacion"];
    [encoder encodeObject:self.lugar forKey:@"lugar"];
    [encoder encodeObject:self.sueldo forKey:@"sueldo"];
    [encoder encodeObject:self.perfil forKey:@"perfil"];
    [encoder encodeObject:self.idBolsaTrabajo forKey:@"idBolsaTrabajo"];
    }


@end
