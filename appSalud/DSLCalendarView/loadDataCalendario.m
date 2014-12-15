//
//  loadDataCalendario.m
//  appSalud
//
//  Created by Christopher Hardy on 12/15/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import "loadDataCalendario.h"
#import "evento.h"

@implementation loadDataCalendario{
    NSMutableArray *tempArrayPreguntas;
    
    NSXMLParser *parser;
    NSString *stringBuffer;
    NSString *stringTemp;
    //    NSMutableArray *arrayVacanteServicio;
    
    evento *tempEvento;
    NSDateFormatter *dateFormatter;
    
    NSDate *capturedStartDate;
}

-(void)cargaInicial{
    self.arrayEventos = [[NSMutableArray alloc] init];
    dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:-6]];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"es_ES"]];
    
    [self parseXML];
}


- (void)parseXML{
    
//    NSString *path = @"http://localhost:8888/ConfigAppiOS/obtenEncuestas.php";
//    NSURL *xmlURL = [NSURL URLWithString:path];
//    parser = [NSURL URLWithString:path ];
//    parser = [[NSXMLParser alloc] initWithContentsOfURL:xmlURL];
//    parser.delegate = self;
//    tempArrayPreguntas = [[NSMutableArray alloc] init];
//    [parser parse];
    
    NSString *xmlPath = [[NSBundle mainBundle] pathForResource:@"Calendario" ofType:@"xml"];
    NSData *xmlData = [NSData dataWithContentsOfFile:xmlPath];
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:xmlData];
    stringTemp = [[NSString alloc] init];
    parser = xmlParser;
    parser.delegate = self;

    [parser parse];
    
}

#pragma mark - NSXMLParserDelegate

- (void)parserDidStartDocument:(NSXMLParser *)parser {
    //_arrayDatos = [[Ruta alloc] init];
}


- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    if ([elementName isEqualToString:@"eventos"]) {
        tempEvento = [[evento alloc]init];
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
    if ([elementName isEqualToString:@"titulo"]) {
        tempEvento.titulo = stringBuffer;
        stringTemp=@"";
        stringBuffer=@"";
    }
    
    else if ([elementName isEqualToString:@"descripcion"]) {
        tempEvento.descripcion = stringBuffer;
        stringTemp=@"";
        stringBuffer=@"";
    }
    
    else if ([elementName isEqualToString:@"fecha"]) {
        capturedStartDate = [dateFormatter dateFromString: stringBuffer];
        NSLog(@"Captured Date %@", [capturedStartDate description]);
        tempEvento.fecha=capturedStartDate;
        [self.arrayEventos addObject:tempEvento];
        capturedStartDate = nil;
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
