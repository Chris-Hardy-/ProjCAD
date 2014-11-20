//
//  noticia.h
//  appSalud
//
//  Created by Christopher Hardy on 9/9/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface noticia : NSObject <NSCoding>

@property (nonatomic, copy) NSString *textoNoticia;
@property (nonatomic, copy) NSString *tituloNoticia;
@property (nonatomic, copy) NSString *urlNoticia;
@property (nonatomic, copy) NSData *imagenNoticia;
@property (nonatomic, copy) NSString *urlImagen;

@end
