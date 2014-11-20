//
//  indice_consejo.m
//  appSalud
//
//  Created by Christopher Hardy on 9/9/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import "indice_consejo.h"

@implementation indice_consejo
@synthesize texto=_texto;
@synthesize titulo=_titulo;

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (!self) {
        return nil;
    }    
    self.texto = [decoder decodeObjectForKey:@"texto"];
    self.titulo = [decoder decodeObjectForKey:@"titulo"];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    
    [encoder encodeObject:self.texto forKey:@"texto"];
    [encoder encodeObject:self.titulo forKey:@"titulo"];
}


@end
