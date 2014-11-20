//
//  loadDataNoticias.h
//  appSalud
//
//  Created by Christopher Hardy on 9/9/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface loadDataNoticias : NSObject <NSXMLParserDelegate>

@property (nonatomic) NSMutableArray *arrayNoticias;
@property (nonatomic) NSMutableArray *arrayIndicadores;
@property (nonatomic) NSMutableArray *arrayConsejosEstacionales;
@property (nonatomic) NSMutableArray *arrayConsejosNutricionales;

-(void)cargaInicial;

@end
