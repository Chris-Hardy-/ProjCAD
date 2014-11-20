//
//  mensaje.h
//  appSalud
//
//  Created by Christopher Hardy on 8/28/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface mensaje : NSObject  <NSCoding>
@property (nonatomic, copy) NSString *mensaje;
@property (nonatomic, copy) NSString *nombre;
@property (nonatomic, copy) NSString *apellidos;
@property (nonatomic) NSString *urlImagen;
@property (nonatomic, copy) NSData *imagenPerfil;
@property (nonatomic, assign) float latitud;
@property (nonatomic, assign) float longitud;

@property (getter = isAvailable) BOOL available;

@end
