//
//  loadDataUpdates.h
//  appSalud
//
//  Created by Christopher Hardy on 12/17/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface loadDataUpdates : NSObject <NSXMLParserDelegate>

@property (nonatomic, copy) NSString *acercaNosotros;
@property (nonatomic, copy) NSString *sucursales;
@property (nonatomic, copy) NSString *noticias;
@property (nonatomic, copy) NSString *serviciosocial;
@property (nonatomic, copy) NSString *bolsatrabajo;
@property (nonatomic, copy) NSString *encuestas;

-(void)cargaInicial;

@end
