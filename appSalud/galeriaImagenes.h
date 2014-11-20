//
//  galeriaImagenes.h
//  appSalud
//
//  Created by Christopher Hardy on 8/28/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface galeriaImagenes : NSObject
@property (nonatomic, copy) NSString *urlImagen;
@property (nonatomic) NSData *imagen;
@property (nonatomic, copy) NSString *titulo;

@property (getter = isAvailable) BOOL available;

@end
