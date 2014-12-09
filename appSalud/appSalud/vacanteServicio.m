//
//  vacanteServicio.m
//  appSalud
//
//  Created by Dulce Beatriz Godinez Guerrero on 28/11/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import "vacanteServicio.h"

@implementation vacanteServicio

@synthesize nombreServicioSocial=_nombreServicioSocial;
@synthesize periodoInicio=_periodoInicio;
@synthesize periodoFin=_periodoFin;
@synthesize habilidades=_habilidades;
@synthesize perfil=_perfil;

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    
    self.nombreServicioSocial = [decoder decodeObjectForKey:@"nombreServicioSocial"];
    self.periodoInicio = [decoder decodeObjectForKey:@"periodoInicio"];
    self.periodoFin = [decoder decodeObjectForKey:@"periodoFin"];
    self.habilidades= [decoder decodeObjectForKey:@"habilidades"];
    self.perfil = [decoder decodeObjectForKey:@"perfil"];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.nombreServicioSocial forKey:@"nombreServicioSocial"];
    [encoder encodeObject:self.periodoInicio forKey:@"periodoInicio"];
    [encoder encodeObject:self.periodoFin forKey:@"periodoFin"];
    [encoder encodeObject:self.habilidades forKey:@"habilidades"];
    [encoder encodeObject:self.habilidades forKey:@"perfil"];
}

@end
