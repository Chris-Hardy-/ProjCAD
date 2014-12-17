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
#import "CustomAnnotation.h"
#import "BasicMapAnnotation.h"
#import "CalloutMapAnnotationView.h"

@interface ViewControllerSucursales (){
    NSUserDefaults *userDefaults;
    NSArray *arraySucursales;
    CustomAnnotation *tempSucursal;
    CustomAnnotation *sucursalInfo;
    
}

@property (nonatomic, retain) CalloutMapAnnotation *calloutAnnotation;
@property (nonatomic, retain) BasicMapAnnotation *customAnnotation;
@property (nonatomic, retain) BasicMapAnnotation *normalAnnotation;

@end

@implementation ViewControllerSucursales

@synthesize initialLocation=_initialLocation;

@synthesize calloutAnnotation = _calloutAnnotation;
@synthesize selectedAnnotationView = _selectedAnnotationView;
@synthesize customAnnotation = _customAnnotation;
@synthesize normalAnnotation = _normalAnnotation;



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
    
    self.title=@"Sucursales";
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    UIImage *menu = [UIImage imageNamed:@"menu.png"];
    
    UIBarButtonItem *flipButton = [[UIBarButtonItem alloc]
                                   initWithImage:menu style:UIBarButtonItemStyleBordered target:self.revealViewController action:@selector(revealToggle:)];
    self.navigationItem.leftBarButtonItem = flipButton;
    
    userDefaults =[NSUserDefaults standardUserDefaults];
    NSData *arrayData = [userDefaults objectForKey:@"arraySucursales"];
    arraySucursales = [NSKeyedUnarchiver unarchiveObjectWithData:arrayData];
    
    self.mapView.delegate = self;
    
    NSMutableArray *tempAnnotations = [[NSMutableArray alloc] init];
    
    for ( int i=0; i<[arraySucursales count]; i++) {
        tempSucursal = [arraySucursales objectAtIndex:i];
        CLLocationCoordinate2D sucLocation = CLLocationCoordinate2DMake(tempSucursal.latitud, tempSucursal.longitud);
        
        [tempSucursal setCoordinate:sucLocation];
        [tempSucursal setTitle:tempSucursal.nombre];
        
        [tempAnnotations addObject:tempSucursal];
    }
    
    
    [self.mapView addAnnotations:tempAnnotations];
    
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backgroundTexture.png"]];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    if ( !self.initialLocation )
    {
        self.initialLocation = userLocation.location;
        
        MKCoordinateRegion region;
        region.center = self.mapView.userLocation.coordinate;
        region.span = MKCoordinateSpanMake(0.1, 0.1);
        
        region = [self.mapView regionThatFits:region];
        [self.mapView setRegion:region animated:YES];
    }
}

- (MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>) annotation
{
    if (annotation == mapView.userLocation) return nil;
    
    NSString *tempString = [[NSString alloc]init];
    
    if ([annotation isKindOfClass:[CustomAnnotation class]])
    {
        MKPinAnnotationView *pinView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"pinView"];
        
        if (!pinView) {
            
            pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"pinView"];
            
//            pinView.animatesDrop = YES;
//            pinView.canShowCallout = YES;
            
            UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            pinView.rightCalloutAccessoryView = rightButton;
        } else {
            pinView.annotation = annotation;
        }
        
        
        tempString = ((CustomAnnotation *)annotation).tipo;
        //tempString = ((CustomAnnotation *)annotation).nombre;
        
        if ( [ tempString isEqualToString:@"Jurisdicción"]) {
            pinView.image = [UIImage imageNamed:@"jurisdiccionAnnot.png"];
//            pinView.pinColor = MKPinAnnotationColorRed;
        }
        else if ([((CustomAnnotation *)annotation).tipo isEqualToString:@"Centro de Salud"]) {
            pinView.image = [UIImage imageNamed:@"centroSaludAnnot.png"];
//            pinView.pinColor = MKPinAnnotationColorGreen;
        }
        else if ([((CustomAnnotation *)annotation).tipo isEqualToString:@"Hospital"]){
            pinView.image = [UIImage imageNamed:@"hospitalAnnot.png"];
//            pinView.pinColor = MKPinAnnotationColorPurple;
        }
        else
            pinView.image = [UIImage imageNamed:@"oficinaAnnot.png"];
            
        
        
        return pinView;
    }
    
    if (annotation == self.calloutAnnotation) {
        
		CalloutMapAnnotationView *calloutMapAnnotationView = (CalloutMapAnnotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:@"CalloutAnnotation"];
//		if (!calloutMapAnnotationView) {
			calloutMapAnnotationView = [[CalloutMapAnnotationView alloc] initWithAnnotation:annotation
																			 reuseIdentifier:@"CalloutAnnotation"];
			calloutMapAnnotationView.contentHeight = 78.0f;
			UIImage *asynchronyLogo = [UIImage imageNamed:@"asynchrony-logo-small.png"];
			UIImageView *asynchronyLogoView = [[UIImageView alloc] initWithImage:asynchronyLogo];
			asynchronyLogoView.frame = CGRectMake(5, 2, asynchronyLogoView.frame.size.width, asynchronyLogoView.frame.size.height);
			[calloutMapAnnotationView.contentView addSubview:asynchronyLogoView];
            
            NSLog(@"VISTA");
            NSLog(@"%@",sucursalInfo.nombre);
            NSLog(@"%@",sucursalInfo.direccion);
            NSLog(@"%@",sucursalInfo.telefono);
            NSLog(@"%@",sucursalInfo.tipo);
            
            UILabel *yourLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 3000, 20)];
            
            [yourLabel setTextColor:[UIColor whiteColor]];
            [yourLabel setBackgroundColor:[UIColor clearColor]];
            [yourLabel setFont:[UIFont fontWithName: @"Trebuchet MS" size: 14.0f]];
            yourLabel.text = sucursalInfo.nombre;
            [calloutMapAnnotationView.contentView addSubview:yourLabel];
            
            yourLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 3000, 20)];
            
            [yourLabel setTextColor:[UIColor whiteColor]];
            [yourLabel setBackgroundColor:[UIColor clearColor]];
            [yourLabel setFont:[UIFont fontWithName: @"Trebuchet MS" size: 14.0f]];
            yourLabel.text = sucursalInfo.direccion;
            [calloutMapAnnotationView.contentView addSubview:yourLabel];
            
            yourLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, 3000, 20)];
            
            [yourLabel setTextColor:[UIColor whiteColor]];
            [yourLabel setBackgroundColor:[UIColor clearColor]];
            [yourLabel setFont:[UIFont fontWithName: @"Trebuchet MS" size: 14.0f]];
            yourLabel.text = sucursalInfo.telefono;
            [calloutMapAnnotationView.contentView addSubview:yourLabel];
            
            yourLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, 3000, 20)];
            
            [yourLabel setTextColor:[UIColor whiteColor]];
            [yourLabel setBackgroundColor:[UIColor clearColor]];
            [yourLabel setFont:[UIFont fontWithName: @"Trebuchet MS" size: 14.0f]];
            yourLabel.text = sucursalInfo.tipo;
            [calloutMapAnnotationView.contentView addSubview:yourLabel];
            
            
//		}
		calloutMapAnnotationView.parentAnnotationView = self.selectedAnnotationView;
		calloutMapAnnotationView.mapView = self.mapView;
		return calloutMapAnnotationView;
	}
    
    
    
    return nil;
}

-(void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views
{
    MKAnnotationView *av = [mapView viewForAnnotation:mapView.userLocation];
    av.enabled = NO;  //disable touch on user location
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view{
    
    sucursalInfo = ((CustomAnnotation *)view.annotation);
    
    NSLog(@"ANNNOTATION");
    NSLog(@"%@",sucursalInfo.nombre);
    NSLog(@"%@",sucursalInfo.direccion);
    NSLog(@"%@",sucursalInfo.telefono);
    NSLog(@"%@",sucursalInfo.tipo);
    
    if (self.calloutAnnotation == nil) {
        
        self.calloutAnnotation = [[CalloutMapAnnotation alloc] initWithLatitude:view.annotation.coordinate.latitude
                                                                   andLongitude:view.annotation.coordinate.longitude];
    } else {
        self.calloutAnnotation.latitude = view.annotation.coordinate.latitude;
        self.calloutAnnotation.longitude = view.annotation.coordinate.longitude;
    }
    [self.mapView addAnnotation:self.calloutAnnotation];
    self.selectedAnnotationView = view;
}


- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view {
    
	if (self.calloutAnnotation || view.annotation == self.customAnnotation) {
		[self.mapView removeAnnotation: self.calloutAnnotation];
	}
}

@end
