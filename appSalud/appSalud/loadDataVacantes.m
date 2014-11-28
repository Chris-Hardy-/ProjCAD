//
//  loadDataVacantes.m
//  appSalud
//
//  Created by Dulce Beatriz Godinez Guerrero on 28/11/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import "loadDataVacantes.h"
#import "vacante.h"

@interface loadDataVacantes () {
    NSXMLParser *parser;
    NSString *stringBuffer;
    NSMutableArray *arrayVacantes;
    
}


@end

@implementation loadDataVacantes

@synthesize arrayVacantes = _arrayVacantes;
//@synthesize arrayVacantesServicio = _arrayVacantesServicio;


- (void)parseXML{
    
    NSString *path = @"http://localhost:8888/ConfigAppiOS/obtenBolsaTrabajo.php";
    NSURL *xmlURL = [NSURL URLWithString:path];
    parser = [NSURL URLWithString:path ];
    parser = [[NSXMLParser alloc] initWithContentsOfURL:xmlURL];
    parser.delegate = self;
    [parser parse];
    
    
}
@end


