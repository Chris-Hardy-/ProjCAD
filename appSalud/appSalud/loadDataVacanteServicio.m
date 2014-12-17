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
    NSString *stringTemp;
    NSMutableArray *arrayVacanteServicio;
    
    vacanteServicio *tempVacanteS;
    
}


@end

@implementation loadDataVacanteServicio

@synthesize arrayVacanteServicio = _arrayVacanteServicio;

-(void)cargaInicial{
    self.arrayVacanteServicio = [[NSMutableArray alloc] init];
    [self parseXML];
}


- (void)parseXML{
    
    NSString *path = @"http://192.168.1.159:8888/ConfigAppiOS/obtenServicioSocial.php";
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
    if ([elementName isEqualToString:@"ServicioSocialSSH"]) {
        tempVacanteS = [[vacanteServicio alloc]init];
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
    if ([elementName isEqualToString:@"idserviciosocial"]) {
        tempVacanteS.idVacanteServicio = stringBuffer;
        stringTemp=@"";
        stringBuffer=@"";
    }
    else if ([elementName isEqualToString:@"serviciosocial"]) {
          tempVacanteS.nombreServicioSocial = stringBuffer;
          stringTemp=@"";
          stringBuffer=@"";
    }
    else if ([elementName isEqualToString:@"periodoinicio"]) {
        tempVacanteS.periodoInicio = stringBuffer;
        stringTemp=@"";
        stringBuffer=@"";
    }
    else if ([elementName isEqualToString:@"periodofin"]) {
        tempVacanteS.periodoFin = stringBuffer;
        stringTemp=@"";
        stringBuffer=@"";
    }
    else if ([elementName isEqualToString:@"habilidades"]) {
        tempVacanteS.habilidades = stringBuffer;
        stringTemp=@"";
        stringBuffer=@"";
    }
    else if ([elementName isEqualToString:@"perfil"]) {
        tempVacanteS.perfil = stringBuffer;
        stringTemp=@"";
        stringBuffer=@"";
        
        [self.arrayVacanteServicio addObject:tempVacanteS];
        tempVacanteS = [[vacanteServicio alloc]init];
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
