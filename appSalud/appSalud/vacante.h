//
//  vacante.h
//  appSalud
//
//  Created by Dulce Beatriz Godinez Guerrero on 28/11/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface vacante : NSObject <NSCoding>
@property (nonatomic, copy)NSString *bolsaTrabajo;
@property (nonatomic, copy)NSString *fecPublicacion;
@property (nonatomic, copy)NSString *lugar;
@property (nonatomic, assign) float sueldo;
@property (nonatomic, copy)NSString *perfil;

@end
