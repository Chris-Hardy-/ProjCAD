//
//  ViewControllerSucursales.m
//  appSalud
//
//  Created by Christopher Hardy on 10/24/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import "ViewControllerSucursales.h"
#import "SWRevealViewController.h"
#import "sucursal.h"



@interface ViewControllerSucursales (){
    NSUserDefaults *userDefaults;
    NSArray *arraySucursales;
    sucursal *tempSucursal;
    
}

@end

@implementation ViewControllerSucursales

@synthesize initialLocation=_initialLocation;


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
    
    self.title=@"Calendario";
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    UIImage *menu = [UIImage imageNamed:@"menu.png"];
    
    UIBarButtonItem *flipButton = [[UIBarButtonItem alloc]
                                   initWithImage:menu style:UIBarButtonItemStyleBordered target:self.revealViewController action:@selector(revealToggle:)];
    self.navigationItem.leftBarButtonItem = flipButton;
    
    userDefaults =[NSUserDefaults standardUserDefaults];
    NSData *arrayData = [userDefaults objectForKey:@"arraySucursales"];
    arraySucursales = [NSKeyedUnarchiver unarchiveObjectWithData:arrayData];
    
    [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    
    for ( int i=0; i<[arraySucursales count]; i++)
    {
        tempSucursal = [arraySucursales objectAtIndex:i];
        CLLocationCoordinate2D coord;
        
        
        coord.latitude=[[NSString stringWithFormat:@"%f",
                         tempSucursal.latitud] floatValue];
        coord.longitude=[[NSString stringWithFormat:@"%f",
                          tempSucursal.longitud] floatValue];
        MKCoordinateRegion region1;
        region1.center=coord;
        region1.span.longitudeDelta=20 ;
        region1.span.latitudeDelta=20;
        //[self.mapSurcursales setRegion:region1 animated:YES];
        
        NSString *titleStr =tempSucursal.nombre;
        MKPointAnnotation* annotation= [MKPointAnnotation new];
        annotation.coordinate=coord;
        annotation.title = titleStr;
        [self.mapSurcursales addAnnotation:annotation];
    }
    
    self.mapSurcursales.delegate = self;
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backgroundTexture.png"]];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view{
    if(view.selected == YES)
        NSLog(@"Seleccionado");
    
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    if ( !self.initialLocation )
    {
        self.initialLocation = userLocation.location;
        
        MKCoordinateRegion region;
        region.center = self.mapSurcursales.userLocation.coordinate;
        region.span = MKCoordinateSpanMake(0.1, 0.1);
        
        region = [self.mapSurcursales regionThatFits:region];
        [self.mapSurcursales setRegion:region animated:YES];
    }
}


@end
