//
//  loadDataVacantes.h
//  appSalud
//
//  Created by Dulce Beatriz Godinez Guerrero on 28/11/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface loadDataVacantes : NSObject <NSXMLParserDelegate>
@property (nonatomic) NSMutableArray *arrayVacantes;

-(void) cargaInicial;
@end
