//
//  vacanteServicio.m
//  appSalud
//
//  Created by Dulce Beatriz Godinez Guerrero on 28/11/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import "vacanteServicio.h"

@implementation vacanteServicio

@synthesize servicioSocial=_servicioSocial;
@synthesize periodoInicio=_periodoInicio;
@synthesize periodoFin=_periodoFin;
@synthesize habilidades=_habilidades;

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    
    self.servicioSocial = [decoder decodeObjectForKey:@"servicioSocial"];
    self.periodoInicio = [decoder decodeObjectForKey:@"periodoInicio"];
    self.periodoFin = [decoder decodeObjectForKey:@"periodoFin"];
    self.habilidades= [decoder decodeObjectForKey:@"habilidades"];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.servicioSocial forKey:@"servicioSocial"];
    [encoder encodeObject:self.periodoInicio forKey:@"periodoInicio"];
    [encoder encodeObject:self.periodoFin forKey:@"periodoFin"];
    [encoder encodeObject:self.habilidades forKey:@"habilidades"];
}

@end
