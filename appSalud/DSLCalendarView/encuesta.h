//
//  encuesta.h
//  appSalud
//
//  Created by Christopher Hardy on 12/15/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface encuesta : NSObject <NSCoding>

@property (nonatomic, copy)NSString *idEncuesta;
@property (nonatomic, copy)NSString *nombre;
@property (nonatomic, assign) NSArray *arrayPreguntas;

@end
