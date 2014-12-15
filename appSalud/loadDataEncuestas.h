//
//  loadDataEncuestas.h
//  appSalud
//
//  Created by Christopher Hardy on 12/15/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface loadDataEncuestas : NSObject<NSXMLParserDelegate>
@property (nonatomic) NSMutableArray *arrayEncuestas;

-(void)cargaInicial;

@end
