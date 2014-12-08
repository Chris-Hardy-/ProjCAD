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
    NSString *stringTemp;
    NSMutableArray *arrayVacantes;
    
    vacante *tempVacante;
}


@end

@implementation loadDataVacantes

@synthesize arrayVacantes = _arrayVacantes;

-(void)cargaInicial{
    self.arrayVacantes = [[NSMutableArray alloc] init];
    [self parseXML];
}


- (void)parseXML{
    
    NSString *path = @"http://localhost:8888/ConfigAppiOS/obtenBolsaTrabajo.php";
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
    if ([elementName isEqualToString:@"BolsaTrabajoSSH"]) {
        tempVacante = [[vacante alloc]init];
    }
    
    else
        stringBuffer = [[NSString alloc] init];
}


- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    string = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    stringTemp = [stringTemp stringByAppendingString:string];
    stringBuffer = stringTemp;
    
}


- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    if ([elementName isEqualToString:@"bolsatrabajo"]) {
        tempVacante.bolsaTrabajo   = stringBuffer;
        stringTemp=@"";
        stringBuffer=@"";
    }
    else if ([elementName isEqualToString:@"fecpublicacion"]) {
        tempVacante.fecPublicacion = stringBuffer;
        stringTemp=@"";
        stringBuffer=@"";
    }
    else if ([elementName isEqualToString:@"lugar"]) {
        tempVacante.lugar= stringBuffer;
        stringTemp=@"";
        stringBuffer=@"";
        
        [self.arrayVacantes addObject:tempVacante];
        tempVacante = [[vacante alloc]init];
        stringTemp=@"";
        stringBuffer=@"";
    }
    else if ([elementName isEqualToString:@"sueldo"]) {
        tempVacante.sueldo = [stringBuffer doubleValue];
        stringTemp=@"";
        stringBuffer=@"";
        
        [self.arrayVacantes addObject:tempVacante];
        tempVacante = [[vacante alloc]init];
        stringTemp=@"";
        stringBuffer=@"";
    }
    else if ([elementName isEqualToString:@"perfil"]) {
        tempVacante.perfil = stringBuffer;
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


