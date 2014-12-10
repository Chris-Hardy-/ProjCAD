//
//  vacanteServicio.h
//  appSalud
//
//  Created by Dulce Beatriz Godinez Guerrero on 28/11/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface vacanteServicio : NSObject <NSCoding>

@property (nonatomic, copy)NSString *nombreServicioSocial;
@property (nonatomic, copy)NSString *periodoInicio;
@property (nonatomic, copy)NSString *periodoFin;
@property (nonatomic, copy)NSString *habilidades;
@property (nonatomic, copy)NSString *perfil;

@end
