//
//  AppDelegate.m
//  appSalud
//
//  Created by Christopher Hardy on 8/19/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import "AppDelegate.h"
#import "loadDataAcercaNosotros.h"
#import "mensaje.h"
#import "galeriaImagenes.h"
#import "loadDataNoticias.h"
#import "loadDataSucursales.h"
#import "noticia.h"
#import "indice_consejo.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    // Change the background color of navigation bar
    [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
    
    // Change the font style of the navigation bar
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];
    shadow.shadowOffset = CGSizeMake(0, 0);
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                           [UIColor colorWithRed:10.0/255.0 green:10.0/255.0 blue:10.0/255.0 alpha:1.0], NSForegroundColorAttributeName,
                                                           shadow, NSShadowAttributeName,
                                                           [UIFont fontWithName:@"Helvetica-Light" size:21.0], NSFontAttributeName, nil]];
    [self cargaInicial];
    
//    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:114 green:161 blue:54 alpha:1]];
    
    UIColor *selectedColor =[UIColor colorWithRed:114.0/255.0 green:161.0/255.0 blue:54.0/255.0 alpha:1];
    
    [[UINavigationBar appearance] setBarTintColor:selectedColor];
    
    return YES;
    
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void)cargaInicial{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    UIImage *imagen;
    NSData *imagenData;
    NSMutableArray *arrayTemp = [[NSMutableArray alloc] init];
    mensaje *mensajeTemp;
    galeriaImagenes *galeriaTemp;
    noticia *noticiaTemp;
    
    
    loadDataAcercaNosotros *loader;
    loader=[[loadDataAcercaNosotros alloc]init];
    [loader cargaInicial];
    
    //  CARGA DE XML SECCION ACERCA DE NOSOTROS
//    imagen = [self loadImage:loader.urlOrganigrama];
//    imagenData = UIImagePNGRepresentation(imagen);
//    [userDefaults setObject:imagenData forKey:@"imagenOrganigrama"];
    
    //CARGA ARRAY MENSAJES
    for (int i=0; i<[loader.arrayMensajes count]; i++) {
        mensajeTemp = [loader.arrayMensajes objectAtIndex:i];
        imagen = [self loadImage:mensajeTemp.urlImagen];
        imagenData = UIImagePNGRepresentation(imagen);
        mensajeTemp.imagenPerfil=imagenData;
        [arrayTemp addObject:mensajeTemp];
    }
    NSArray *someArray = [[NSArray alloc] initWithArray:arrayTemp];
    NSData *arrayData = [NSKeyedArchiver archivedDataWithRootObject:someArray];
    [userDefaults setObject:arrayData forKey:@"arrayMensajes"];
    [arrayTemp removeAllObjects];
    
    //CARGA DE ARRAY GALERIA
    for (int i=0; i<[loader.arrayGaleria count]; i++) {
        galeriaTemp = [loader.arrayGaleria objectAtIndex:i];
        imagen = [self loadImage:mensajeTemp.urlImagen];
        imagenData = UIImagePNGRepresentation(imagen);
        galeriaTemp.imagen = imagenData;
        [arrayTemp addObject:galeriaTemp];
    }
    
    someArray= [[NSArray alloc] initWithArray:arrayTemp];
    arrayData = [NSKeyedArchiver archivedDataWithRootObject:someArray];
    [userDefaults setObject:arrayData forKey:@"arrayGaleria"];
    [arrayTemp removeAllObjects];
    
    
    //  CARGA DE XML SECCION NOTICIAS
    
    loadDataNoticias *loaderNoticas = [[loadDataNoticias alloc] init];
    [loaderNoticas cargaInicial];
    
    // CARGA DE ARRAY NOTICAS
    for (int i=0; i<[loaderNoticas.arrayNoticias count]; i++) {
        noticiaTemp = [loaderNoticas.arrayNoticias objectAtIndex:i];
        imagen = [self loadImage:noticiaTemp.urlImagen];
        imagenData = UIImagePNGRepresentation([self loadImage:noticiaTemp.urlImagen]);
        noticiaTemp.imagenNoticia = imagenData;
        [arrayTemp addObject:noticiaTemp];
    }
    someArray= [[NSArray alloc] initWithArray:arrayTemp];
    arrayData = [NSKeyedArchiver archivedDataWithRootObject:someArray];
    [userDefaults setObject:arrayData forKey:@"arrayNoticias"];
    [arrayTemp removeAllObjects];
    
    // CARGA ARRAY INDICADORES PUBLICOS
    someArray= [[NSArray alloc] initWithArray:loaderNoticas.arrayIndicadores];
    arrayData = [NSKeyedArchiver archivedDataWithRootObject:someArray];
    [userDefaults setObject:arrayData forKey:@"arrayIndicadores"];
    [arrayTemp removeAllObjects];
    
    //  CARGA ARRAY CONSEJOS ESTACIONALES
    someArray= [[NSArray alloc] initWithArray:loaderNoticas.arrayConsejosEstacionales];
    arrayData = [NSKeyedArchiver archivedDataWithRootObject:someArray];
    [userDefaults setObject:arrayData forKey:@"arrayConsejosEstacionales"];
    [arrayTemp removeAllObjects];
    
    //  CARGA ARRAY CONSEJOS NUTRICIONALES
    someArray= [[NSArray alloc] initWithArray:loaderNoticas.arrayConsejosNutricionales];
    arrayData = [NSKeyedArchiver archivedDataWithRootObject:someArray];
    [userDefaults setObject:arrayData forKey:@"arrayConsejosNutricionales"];
    [arrayTemp removeAllObjects];
    
    //CARGA DE XML SECCION SUCURSALES
    loadDataSucursales *loaderSucursales = [[loadDataSucursales alloc] init];
    [loaderSucursales cargaInicial];
    someArray = [[NSArray alloc] initWithArray:loaderSucursales.arraySucursales];
    arrayData = [NSKeyedArchiver archivedDataWithRootObject:someArray];
    [userDefaults setObject:arrayData forKey:@"arraySucursales"];
    [arrayTemp removeAllObjects];
    
    //CARGA DE XML VACANTES
    someArray= [[NSArray alloc] initWithArray:loaderNoticas.arrayConsejosNutricionales];
    arrayData = [NSKeyedArchiver archivedDataWithRootObject:someArray];
    [userDefaults setObject:arrayData forKey:@"arrayConsejosNutricionales"];
    [arrayTemp removeAllObjects];
    
    //CARGA DE XML COMUNICATE
    
}

-(UIImage*) loadImage:(NSString *) url_imagen
{
    NSURL *url = [NSURL URLWithString:url_imagen];
    NSData * data = [NSData dataWithContentsOfURL:url];
    UIImage * image = [UIImage imageWithData:data];
    //image = [UIImage ima]
    
    if (image)
    {
        return image;
    }
    else
    {
        NSLog(@"no se pudo cargar la imagen");
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"No se pudo cargar imagen" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:@"Ok", nil];
        [alert show];
        return nil;
    }
    [self reloadInputViews];
}

@end
