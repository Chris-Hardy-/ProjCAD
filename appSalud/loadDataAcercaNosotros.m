//
//  loadDataAcercaNosotros.m
//  appSalud
//
//  Created by Christopher Hardy on 8/28/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import "loadDataAcercaNosotros.h"
#import "mensaje.h"
#import "galeriaImagenes.h"


@interface loadDataAcercaNosotros () {
    NSXMLParser *parser;
    NSString *stringBuffer;
    NSString *stringTemp;
    mensaje *mensajeAgregar;
    NSString *urlOrganigrama;
    galeriaImagenes *imagenAgregar;
}


@end


@implementation loadDataAcercaNosotros

@synthesize urlOrganigrama=_urlOrganigrama;
@synthesize arrayGaleria = _arrayGaleria;
@synthesize arrayMensajes = _arrayMensajes;

-(void)cargaInicial{
    //arrayMensajes = [[NSMutableArray alloc] init];
    //arrayGaleria= [[NSMutableArray alloc] init];
    //imagenAgregar = [[galeriaImagenes alloc] init];
    //mensajeAgregar = [[mensaje alloc] init];
    [self parseXML];
    
    
}

- (void)parseXML{
    
//    NSString *xmlPath = [[NSBundle mainBundle] pathForResource:@"AcercaDeNosotros" ofType:@"xml"];
//    NSData *xmlData = [NSData dataWithContentsOfFile:xmlPath];
//    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:xmlData];
//    stringTemp = [[NSString alloc] init];
//    parser = xmlParser;
//    parser.delegate = self;
//    
//    [parser parse];
    
    NSString *path = @"http://192.168.1.159:8888/ConfigAppiOS/obtenAcercaGaleria.php";
    
//    NSString *path = @"http://localhost:8888/ConfigAppiOS/obtenAcercaGaleria.php";
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
    if ([elementName isEqualToString:@"acercanosotros"]) {
        //arrayMensajes = [[NSMutableArray alloc] init];
        //arrayGaleria = [[NSMutableArray alloc] init];
        self.arrayGaleria = [[NSMutableArray alloc] init];
        self.arrayMensajes = [[NSMutableArray alloc] init];
        imagenAgregar = [[galeriaImagenes alloc ] init];
        stringTemp = [[NSString alloc] init];
        stringBuffer = [[NSString alloc] init];
        
        
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
    if ([elementName isEqualToString:@"personaNombre"]) {
        mensajeAgregar = [[mensaje alloc] init];
        mensajeAgregar.nombre = stringBuffer;
        stringTemp=@"";
        stringBuffer=@"";
    }
    else if ([elementName isEqualToString:@"personaApellido"]) {
        mensajeAgregar.apellidos = stringBuffer;
        stringTemp=@"";
        stringBuffer=@"";
    }
    else if ([elementName isEqualToString:@"urlFoto"]) {
        mensajeAgregar.urlImagen = stringBuffer;
        stringTemp=@"";
        stringBuffer=@"";
    }
    else if ([elementName isEqualToString:@"mensajePersona"]) {
        mensajeAgregar.mensaje = stringBuffer;
        stringTemp=@"";
        stringBuffer=@"";
    }
    else if ([elementName isEqualToString:@"latitud"]) {
        mensajeAgregar.latitud = [stringBuffer doubleValue];
        stringTemp=@"";
        stringBuffer=@"";
    }
    else if ([elementName isEqualToString:@"longitud"]) {
        mensajeAgregar.longitud = [stringBuffer doubleValue];
        [self.arrayMensajes addObject:mensajeAgregar];
        stringTemp=@"";
        stringBuffer=@"";
    }
    else if ([elementName isEqualToString:@"urlOrga"]) {
        self.urlOrganigrama = stringBuffer;
    }
    //    else if ([elementName isEqualToString:@"galeria"]) {
    //        arrayGaleria = [[NSMutableArray alloc ]init ];
    //    }
    else if ([elementName isEqualToString:@"imagen"]) {
        //imagenAgregar = [[galeriaImagenes alloc ] init];
    }
    else if ([elementName isEqualToString:@"urlImagen"]) {
        imagenAgregar = [[galeriaImagenes alloc] init];
        imagenAgregar.urlImagen = stringBuffer;
        stringTemp=@"";
        stringBuffer=@"";
    }
    else if ([elementName isEqualToString:@"titulo"]) {
        imagenAgregar.titulo = stringBuffer;
        [self.arrayGaleria addObject:imagenAgregar];
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
