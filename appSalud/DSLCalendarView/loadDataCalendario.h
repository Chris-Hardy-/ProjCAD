//
//  loadDataCalendario.h
//  appSalud
//
//  Created by Christopher Hardy on 12/15/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface loadDataCalendario : NSObject<NSXMLParserDelegate>
@property (nonatomic) NSMutableArray *arrayEventos;

-(void)cargaInicial;


@end
