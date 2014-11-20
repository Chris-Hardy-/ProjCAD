//
//  ViewControllerMensaje.m
//  appSalud
//
//  Created by Christopher Hardy on 9/6/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import "ViewControllerMensaje.h"
#import "mensaje.h"

@interface ViewControllerMensaje (){
    NSUserDefaults *userDefaults;
    NSArray *arregloTemp;
}

@end

@implementation ViewControllerMensaje

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
     self.title = @"Mensaje bienvenida";
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backgroundTexture.png"]];
    
    userDefaults =[NSUserDefaults standardUserDefaults];
    
    NSData *arrayData = [userDefaults objectForKey:@"arrayMensajes"];
    arregloTemp = [NSKeyedUnarchiver unarchiveObjectWithData:arrayData];
    
    self.mensajeBienvenida.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backgroundTexture.png"]];
    
    
    
    NSString *mensajeDesplegar = [userDefaults objectForKey:@"mensajeDesplegar"];
    mensaje *mensajeTemp;
    
    if ([mensajeDesplegar isEqualToString:@"persona1"]) {
        mensajeTemp=[arregloTemp objectAtIndex:0];
    }
    else if ([mensajeDesplegar isEqualToString:@"persona2"]){
        mensajeTemp=[arregloTemp objectAtIndex:1];
    }
    else if ([mensajeDesplegar isEqualToString:@"persona3"]){
        mensajeTemp=[arregloTemp objectAtIndex:2];
    }
    
    
    CLLocationCoordinate2D track;
    NSMutableArray *annotationsMapa = [[NSMutableArray alloc]init];
    MKPointAnnotation* annotation= [MKPointAnnotation new];

    track.latitude = (double)mensajeTemp.latitud;
    track.longitude =(double)mensajeTemp.longitud;
    
    self.imagenPerfil.image = [self imageWithImage:[UIImage imageWithData:mensajeTemp.imagenPerfil] scaledToSize:CGSizeMake(120, 120)];
    self.nombrePersona.text = mensajeTemp.nombre;
    self.apellidoPersona.text = mensajeTemp.apellidos;
    self.mensajeBienvenida.text = mensajeTemp.mensaje;
    
    annotation.coordinate=track;
    
    [self.mapaOficina addAnnotation: annotation];
    [annotationsMapa addObject:annotation];
    

    MKCoordinateRegion region = [self regionForAnnotations:annotationsMapa];
    [self.mapaOficina setRegion:region animated:YES];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    //UIGraphicsBeginImageContext(newSize);
    // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
    // Pass 1.0 to force exact pixel size.
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (MKCoordinateRegion)regionForAnnotations:(NSArray *)annotations
{
    MKCoordinateRegion region;
    
    if ([annotations count] == 0)
    {
        region = MKCoordinateRegionMakeWithDistance(_mapaOficina.userLocation.coordinate, 1000, 1000);
    }
    
    else if ([annotations count] == 1)
    {
        id <MKAnnotation> annotation = [annotations lastObject];
        region = MKCoordinateRegionMakeWithDistance(annotation.coordinate, 1000, 1000);
    } else {
        CLLocationCoordinate2D topLeftCoord;
        topLeftCoord.latitude = -90;
        topLeftCoord.longitude = 180;
        
        CLLocationCoordinate2D bottomRightCoord;
        bottomRightCoord.latitude = 90;
        bottomRightCoord.longitude = -180;
        
        for (id <MKAnnotation> annotation in annotations)
        {
            topLeftCoord.latitude = fmax(topLeftCoord.latitude, annotation.coordinate.latitude);
            topLeftCoord.longitude = fmin(topLeftCoord.longitude, annotation.coordinate.longitude);
            bottomRightCoord.latitude = fmin(bottomRightCoord.latitude, annotation.coordinate.latitude);
            bottomRightCoord.longitude = fmax(bottomRightCoord.longitude, annotation.coordinate.longitude);
        }
        
        const double extraSpace = 1.12;
        region.center.latitude = topLeftCoord.latitude - (topLeftCoord.latitude - bottomRightCoord.latitude) / 2.0;
        region.center.longitude = topLeftCoord.longitude - (topLeftCoord.longitude - bottomRightCoord.longitude) / 2.0;
        region.span.latitudeDelta = fabs(topLeftCoord.latitude - bottomRightCoord.latitude) * extraSpace;
        region.span.longitudeDelta = fabs(topLeftCoord.longitude - bottomRightCoord.longitude) * extraSpace;
    }
    
    return [self.mapaOficina regionThatFits:region];
}

@end
