//
//  loadDataSucursales.m
//  appSalud
//
//  Created by Christopher Hardy on 10/23/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import "loadDataSucursales.h"
#import "sucursal.h"



@interface loadDataSucursales () {
    NSXMLParser *parser;
    NSString *stringBuffer;
    NSString *stringTemp;
    sucursal *tempSucursal;
}

@end


@implementation loadDataSucursales

@synthesize arraySucursales = _arraySucursales;

-(void)cargaInicial{
    //arrayMensajes = [[NSMutableArray alloc] init];
    //arrayGaleria= [[NSMutableArray alloc] init];
    //imagenAgregar = [[galeriaImagenes alloc] init];
    //mensajeAgregar = [[mensaje alloc] init];
    //    self.arrayConsejosEstacionales = [[NSMutableArray alloc] init];
    //    self.arrayConsejosNutricionales = [[NSMutableArray alloc] init];
    //    tempNoticia = [[noticia alloc]init];
    //    tempIndiceConsejo = [[indice_consejo alloc]init];
    
    self.arraySucursales = [[NSMutableArray alloc] init];
    
    [self parseXML];
    
    
}

- (void)parseXML{
    
    NSString *xmlPath = [[NSBundle mainBundle] pathForResource:@"Surcursales" ofType:@"xml"];
    NSData *xmlData = [NSData dataWithContentsOfFile:xmlPath];
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:xmlData];
    parser = xmlParser;
    [parser setDelegate:self];
    
    stringTemp = [[NSString alloc] init];
    //parser.delegate = self;
    
    [parser parse];
    
    
    //    NSString *path = @"http://aqtiva.mx/olinia/prueba1.xml";
    //
    //    NSURL *xmlURL = [NSURL URLWithString:path ];
    //    parser =
    //    parser = [[NSXMLParser alloc] initWithContentsOfURL:xmlURL];
    //    parser.delegate = self;
    //    [parser parse];
}

#pragma mark - NSXMLParserDelegate

- (void)parserDidStartDocument:(NSXMLParser *)parser {
    //_arrayDatos = [[Ruta alloc] init];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    if ([elementName isEqualToString:@"sucursales"]) {
        self.arraySucursales = [[NSMutableArray alloc] init];
        tempSucursal = [[sucursal alloc]init];
    }
    
    else
        stringBuffer = [[NSString alloc] init];
    
    //        else if ([elementName isEqualToString:@"idRuta"] || [elementName isEqualToString:@"precio"]  || [elementName isEqualToString:@"nombreRuta"] || [elementName isEqualToString:@"origen"] || [elementName isEqualToString:@"destino"] || [elementName isEqualToString:@"imageCromatica"] || [elementName isEqualToString:@"imageParada"] || [elementName isEqualToString:@"punto"] || [elementName isEqualToString:@"sentido"] || [elementName isEqualToString:@"idpunto"] || [elementName isEqualToString:@"latitud"] || [elementName isEqualToString:@"longitud"] || [elementName isEqualToString:@"nombre"]){
    //            stringBuffer = [[NSMutableString alloc] init];
    //        }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    
    
    string = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    stringTemp = [stringTemp stringByAppendingString:string];
    stringBuffer = stringTemp;
    
}


- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    if ([elementName isEqualToString:@"nombre"]) {
        tempSucursal.nombre = stringBuffer;
        stringTemp=@"";
        stringBuffer=@"";
    }
    else if ([elementName isEqualToString:@"latitud"]) {
        tempSucursal.latitud = [stringBuffer doubleValue];
        stringTemp=@"";
        stringBuffer=@"";
    }
    else if ([elementName isEqualToString:@"longitud"]) {
        tempSucursal.longitud = [stringBuffer doubleValue];
        stringTemp=@"";
        stringBuffer=@"";
        
        [self.arraySucursales addObject:tempSucursal];
        tempSucursal = [[sucursal alloc] init];
    }
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    NSString * errorString = [NSString stringWithFormat:@"Error while processing XML file (Error code %ld)",(long)[parseError code]];
    UIAlertView * errorAlert = [[UIAlertView alloc] initWithTitle:@"ERROR" message:errorString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}



@end
