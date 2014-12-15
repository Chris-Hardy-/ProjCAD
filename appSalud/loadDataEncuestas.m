//
//  loadDataEncuestas.m
//  appSalud
//
//  Created by Christopher Hardy on 12/15/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import "loadDataEncuestas.h"
#import "encuesta.h"

@implementation loadDataEncuestas{
    NSMutableArray *tempArrayPreguntas;
    
    NSXMLParser *parser;
    NSString *stringBuffer;
    NSString *stringTemp;
//    NSMutableArray *arrayVacanteServicio;
    
    encuesta *tempEncuesta;
}

-(void)cargaInicial{
    self.arrayEncuestas = [[NSMutableArray alloc] init];
    [self parseXML];
}


- (void)parseXML{
    
    NSString *path = @"http://localhost:8888/ConfigAppiOS/obtenEncuestas.php";
    NSURL *xmlURL = [NSURL URLWithString:path];
    parser = [NSURL URLWithString:path ];
    parser = [[NSXMLParser alloc] initWithContentsOfURL:xmlURL];
    parser.delegate = self;
    tempArrayPreguntas = [[NSMutableArray alloc] init];
    [parser parse];
    
}

#pragma mark - NSXMLParserDelegate

- (void)parserDidStartDocument:(NSXMLParser *)parser {
    //_arrayDatos = [[Ruta alloc] init];
}


- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    if ([elementName isEqualToString:@"EncuestasSSH"]) {
        tempEncuesta = [[encuesta alloc]init];
        stringTemp = [[NSString alloc] init];
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
    if ([elementName isEqualToString:@"idencuesta"]) {
        
        if ([tempArrayPreguntas count]>=1) {
            tempEncuesta.arrayPreguntas = [NSArray arrayWithArray:tempArrayPreguntas];
            [self.arrayEncuestas addObject:tempEncuesta];
            tempEncuesta = [[encuesta alloc] init];
        }
        
        tempEncuesta.idEncuesta = stringBuffer;
        stringTemp=@"";
        stringBuffer=@"";
    }
    
    else if ([elementName isEqualToString:@"nombre"]) {
        tempEncuesta.nombre = stringBuffer;
        stringTemp=@"";
        stringBuffer=@"";
    }
    
    else if ([elementName isEqualToString:@"pregunta"]) {
        [tempArrayPreguntas addObject:stringBuffer];
        stringTemp=@"";
        stringBuffer=@"";
    }
    
    else if ([elementName isEqualToString:@"EncuestasSSH"]){
        tempEncuesta.arrayPreguntas = [NSArray arrayWithArray:tempArrayPreguntas];
        [self.arrayEncuestas addObject:tempEncuesta];
        tempEncuesta = [[encuesta alloc] init];
    }
    
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    NSString * errorString = [NSString stringWithFormat:@"Error while processing XML file (Error code %ld)",(long)[parseError code]];
    UIAlertView * errorAlert = [[UIAlertView alloc] initWithTitle:@"ERROR" message:errorString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}


@end
