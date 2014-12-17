//
//  loadDataUpdates.m
//  appSalud
//
//  Created by Christopher Hardy on 12/17/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import "loadDataUpdates.h"

@implementation loadDataUpdates{
    NSXMLParser *parser;
    NSString *stringBuffer;
    NSString *stringTemp;
}

@synthesize acercaNosotros,bolsatrabajo,encuestas,noticias,serviciosocial,sucursales;

-(void)cargaInicial{
    self.acercaNosotros = [[NSString alloc] init];
    self.bolsatrabajo = [[NSString alloc] init];
    self.encuestas = [[NSString alloc] init];
    self.noticias = [[NSString alloc] init];
    self.serviciosocial = [[NSString alloc] init];
    self.sucursales = [[NSString alloc] init];
    
    [self parseXML];
}


- (void)parseXML{
    
    NSString *path = @"http://192.168.1.159:8888/ConfigAppiOS/obtenUpdates.php";
    NSURL *xmlURL = [NSURL URLWithString:path];
    parser = [NSURL URLWithString:path ];
    parser = [[NSXMLParser alloc] initWithContentsOfURL:xmlURL];
    parser.delegate = self;
    [parser parse];
    
    
}

#pragma mark - NSXMLParserDelegate

- (void)parserDidStartDocument:(NSXMLParser *)parser {
    //_arrayDatos = [[Ruta alloc] init];
}


- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    if ([elementName isEqualToString:@"actualizaciones"]) {
        stringTemp = [[NSString alloc] init];
        stringBuffer = [[NSString alloc] init];
    }
    
//    else
//        stringBuffer = [[NSString alloc] init];
}


- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    string = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    stringTemp = [stringTemp stringByAppendingString:string];
    stringBuffer = stringTemp;
    
}


- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    if ([elementName isEqualToString:@"acercanosotros"]) {
        self.acercaNosotros = stringBuffer;
        stringTemp=@"";
        stringBuffer=@"";
    }
    else if ([elementName isEqualToString:@"sucursales"]) {
        self.sucursales = stringBuffer;
        stringTemp=@"";
        stringBuffer=@"";
    }
    else if ([elementName isEqualToString:@"noticias"]) {
        self.noticias = stringBuffer;
        stringTemp=@"";
        stringBuffer=@"";
    }
    else if ([elementName isEqualToString:@"serviciosocial"]) {
        self.serviciosocial = stringBuffer;
        stringTemp=@"";
        stringBuffer=@"";
    }
    else if ([elementName isEqualToString:@"bolsatrabajo"]) {
        self.bolsatrabajo = stringBuffer;
        stringTemp=@"";
        stringBuffer=@"";
    }
    else if ([elementName isEqualToString:@"encuestas"]) {
        self.encuestas = stringBuffer;
        stringTemp=@"";
        stringBuffer=@"";
    }
    else if ([elementName isEqualToString:@"urls"]) {
        stringTemp=@"";
        stringBuffer=@"";
    }
    else if ([elementName isEqualToString:@"directorio"]) {
        stringTemp=@"";
        stringBuffer=@"";
    }
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    NSString * errorString = [NSString stringWithFormat:@"Error while processing XML file (Error code %ld)",(long)[parseError code]];
    UIAlertView * errorAlert = [[UIAlertView alloc] initWithTitle:@"ERROR" message:errorString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}


@end

