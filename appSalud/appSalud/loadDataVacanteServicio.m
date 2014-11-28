//
//  loadDataVacanteServicio.m
//  appSalud
//
//  Created by Dulce Beatriz Godinez Guerrero on 28/11/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import "loadDataVacanteServicio.h"
#import "vacanteServicio.h"

@interface loadDataVacanteServicio () {
    NSXMLParser *parser;
    NSString *stringBuffer;
    NSMutableArray *arrayVacanteServicio;
    
}


@end

@implementation loadDataVacanteServicio

@synthesize arrayVacanteServicio = _arrayVacanteServicio;


- (void)parseXML{
    
    NSString *path = @"http://localhost:8888/ConfigAppiOS/obtenServicioSocial.php";
    NSURL *xmlURL = [NSURL URLWithString:path];
    parser = [NSURL URLWithString:path ];
    parser = [[NSXMLParser alloc] initWithContentsOfURL:xmlURL];
    parser.delegate = self;
    [parser parse];
    
}

@end
