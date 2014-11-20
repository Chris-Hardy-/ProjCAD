//
//  loadDataAcercaNosotros.h
//  appSalud
//
//  Created by Christopher Hardy on 8/28/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface loadDataAcercaNosotros : NSObject  <NSXMLParserDelegate>

@property (nonatomic, copy) NSString *urlOrganigrama;
@property (nonatomic) NSMutableArray *arrayMensajes;
@property (nonatomic) NSMutableArray *arrayGaleria;


-(void)cargaInicial;


@end
