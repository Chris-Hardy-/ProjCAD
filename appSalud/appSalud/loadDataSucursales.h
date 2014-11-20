//
//  loadDataSucursales.h
//  appSalud
//
//  Created by Christopher Hardy on 10/23/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface loadDataSucursales : NSObject <NSXMLParserDelegate>

@property (nonatomic) NSMutableArray *arraySucursales;

-(void)cargaInicial;

@end
