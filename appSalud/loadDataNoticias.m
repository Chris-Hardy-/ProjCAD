//
//  loadDataNoticias.m
//  appSalud
//
//  Created by Christopher Hardy on 9/9/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import "loadDataNoticias.h"
#import "noticia.h"
#import "indice_consejo.h"



@interface loadDataNoticias () {
    NSXMLParser *parser;
    NSString *stringBuffer;
    NSString *stringTemp;
    noticia *tempNoticia;
    indice_consejo *tempIndiceConsejo;
    //    NSMutableArray *arrayMensajes;
    //    NSMutableArray *arrayGaleria;
    
    //NSMutableArray *arrayRutasFin;
}


@end


@implementation loadDataNoticias

@synthesize arrayNoticias = _arrayNoticias;
@synthesize arrayIndicadores = _arrayIndicadores;
@synthesize arrayConsejosEstacionales = _arrayConsejosEstacionales;
@synthesize arrayConsejosNutricionales = _arrayConsejosNutricionales;

-(void)cargaInicial{
    //arrayMensajes = [[NSMutableArray alloc] init];
    //arrayGaleria= [[NSMutableArray alloc] init];
    //imagenAgregar = [[galeriaImagenes alloc] init];
    //mensajeAgregar = [[mensaje alloc] init];
    //    self.arrayConsejosEstacionales = [[NSMutableArray alloc] init];
    //    self.arrayConsejosNutricionales = [[NSMutableArray alloc] init];
    //    tempNoticia = [[noticia alloc]init];
    //    tempIndiceConsejo = [[indice_consejo alloc]init];
    
    self.arrayNoticias = [[NSMutableArray alloc] init];
    
    [self parseXML];
    
    
}

- (void)parseXML{
    
//    NSString *xmlPath = [[NSBundle mainBundle] pathForResource:@"Noticias" ofType:@"xml"];
//    NSData *xmlData = [NSData dataWithContentsOfFile:xmlPath];
//    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:xmlData];
//    parser = xmlParser;
//    [parser setDelegate:self];
//    stringTemp = [[NSString alloc] init];
//    [parser parse];
    
    NSString *path = @"http://localhost:8888/ConfigAppiOS/obtenNoticiasIndicadoresConsejos.php";
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
    if ([elementName isEqualToString:@"infonoticias"]) {
        self.arrayConsejosEstacionales = [[NSMutableArray alloc] init];
        self.arrayConsejosNutricionales = [[NSMutableArray alloc] init];
        self.arrayIndicadores = [[NSMutableArray alloc]init];
        tempNoticia = [[noticia alloc]init];
        tempIndiceConsejo = [[indice_consejo alloc]init];
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
    if ([elementName isEqualToString:@"tituloNoticia"]) {
        tempNoticia.tituloNoticia = stringBuffer;
        stringTemp=@"";
        stringBuffer=@"";
    }
    else if ([elementName isEqualToString:@"urlImagen"]) {
        tempNoticia.urlImagen = stringBuffer;
        stringTemp=@"";
        stringBuffer=@"";
    }
    else if ([elementName isEqualToString:@"mensajeNoticia"]) {
        tempNoticia.textoNoticia = stringBuffer;
        stringTemp=@"";
        stringBuffer=@"";
        
        [self.arrayNoticias addObject:tempNoticia];
        tempNoticia = [[noticia alloc]init];
        stringTemp=@"";
        stringBuffer=@"";
    }
    else if ([elementName isEqualToString:@"urlNoticia"]) {
        tempNoticia.urlNoticia = stringBuffer;
        
//        [self.arrayNoticias addObject:tempNoticia];
//        tempNoticia = [[noticia alloc]init];
//        stringTemp=@"";
//        stringBuffer=@"";
    }
    else if ([elementName isEqualToString:@"tituloIndicador"]) {
        tempIndiceConsejo.titulo = stringBuffer;
        stringTemp=@"";
        stringBuffer=@"";
    }
    else if ([elementName isEqualToString:@"porcentaje"]) {
        tempIndiceConsejo.texto = [stringBuffer stringByAppendingString:@"%"];
        [self.arrayIndicadores addObject:tempIndiceConsejo];
        tempIndiceConsejo = [[indice_consejo alloc]init];
        stringTemp=@"";
        stringBuffer=@"";
    }
    else if ([elementName isEqualToString:@"mensajenut"]) {
        tempIndiceConsejo.titulo = stringBuffer;
        stringTemp=@"";
        stringBuffer=@"";
    }
    else if ([elementName isEqualToString:@"textoconsejonut"]) {
        tempIndiceConsejo.texto = stringBuffer;
        [self.arrayConsejosNutricionales addObject:tempIndiceConsejo];
        tempIndiceConsejo = [[indice_consejo alloc]init];
        stringTemp=@"";
        stringBuffer=@"";
    }
    else if ([elementName isEqualToString:@"mensajeestacional"]) {
        tempIndiceConsejo.titulo = stringBuffer;
        stringTemp=@"";
        stringBuffer=@"";
    }
    else if ([elementName isEqualToString:@"textoconsejoestacional"]) {
        tempIndiceConsejo.texto = stringBuffer;
        [self.arrayConsejosEstacionales addObject:tempIndiceConsejo];
        tempIndiceConsejo = [[indice_consejo alloc]init];
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