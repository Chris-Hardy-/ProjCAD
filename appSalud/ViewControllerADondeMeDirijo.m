//
//  ViewControllerADondeMeDirijo.m
//  appSalud
//
//  Created by Christopher Hardy on 11/26/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import "ViewControllerADondeMeDirijo.h"
#import "SWRevealViewController.h"
#import <MapKit/MapKit.h>
#import "CustomAnnotation.h"

@interface ViewControllerADondeMeDirijo (){
    bool nacido, nino, adulto, hemorragia, trasladar, quemadura, alergia, fractura;
    float temp;
    NSArray *_pickerData;
    NSArray *_tableData;
    NSArray *arraySucursales;
    CustomAnnotation *tempSucursal, *sucursalCercana;
    NSUserDefaults *userDefaults;
    NSMutableArray *tempAnnotations;
    CLLocationManager *locationManager;
    CLLocationCoordinate2D ubicacionActual;
    UIAlertView *message;
}

@end

@implementation ViewControllerADondeMeDirijo

@synthesize botonAdulto, botonNacido, botonNino, pickerTemperatura, tablePadecimientos;

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
    // Do any additional setup after loading the view.
    
    self.title=@"¿A dónde me dirjo?";
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    UIImage *menu = [UIImage imageNamed:@"menu.png"];
    
    UIBarButtonItem *flipButton = [[UIBarButtonItem alloc]
                                   initWithImage:menu style:UIBarButtonItemStyleBordered target:self.revealViewController action:@selector(revealToggle:)];
    self.navigationItem.leftBarButtonItem = flipButton;
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backgroundTexture.png"]];
    
    _pickerData = @[@"36",@"36.2",@"36.4",@"36.6",@"36.8",@"37",@"37.5",@"37.7",@"38",@"38.2",@"38.4",@"38.6",@"38.8",@"39",@"39.2",@"39.4",@"39.6",@"39.8",@"40"];
    _tableData = @[@"Hemorragia",@"Quemadura", @"Alergias severas", @"Fractura", @"¿Se puede trasladar?"];
    
    self.pickerTemperatura.delegate = self;
    self.pickerTemperatura.dataSource = self;
    self.tablePadecimientos.delegate = self;
    self.tablePadecimientos.dataSource = self;
    
    tablePadecimientos.backgroundView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backgroundTexture.png"]];
    
    [self.pickerTemperatura selectRow:3 inComponent:0 animated:YES];
    tablePadecimientos.showsVerticalScrollIndicator = YES;
    tablePadecimientos.indicatorStyle = UIScrollViewIndicatorStyleBlack;
    
    [tablePadecimientos flashScrollIndicators];
    
    locationManager = [[CLLocationManager alloc] init];
    
    userDefaults =[NSUserDefaults standardUserDefaults];
    NSData *arrayData = [userDefaults objectForKey:@"arraySucursales"];
    arraySucursales = [NSKeyedUnarchiver unarchiveObjectWithData:arrayData];
    tempAnnotations = [[NSMutableArray alloc] init];
    
    for ( int i=0; i<[arraySucursales count]; i++) {
        tempSucursal = [arraySucursales objectAtIndex:i];
        CLLocationCoordinate2D sucLocation = CLLocationCoordinate2DMake(tempSucursal.latitud, tempSucursal.longitud);
        
        [tempSucursal setCoordinate:sucLocation];
        [tempSucursal setTitle:tempSucursal.nombre];
        
        [tempAnnotations addObject:tempSucursal];
    }
    
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [locationManager startUpdatingLocation];
    
    
    NSTimer *aTimer = [NSTimer timerWithTimeInterval:(3.0) target:self selector:@selector(timerFired:) userInfo:nil repeats:NO];
    NSRunLoop *runner = [NSRunLoop currentRunLoop];
    [runner addTimer:aTimer forMode: NSDefaultRunLoopMode];
    
    
}

- (void)viewDidAppear:(BOOL)animated{
    [tablePadecimientos flashScrollIndicators];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)botonReciendNacido:(id)sender {
    [self.botonNacido setSelected:true];
    [self.botonAdulto setSelected:false];
    [self.botonNino setSelected:false];
    nacido = true;
    nino = false;
    adulto = false;
}

- (IBAction)botonNino:(id)sender {
    [self.botonNacido setSelected:false];
    [self.botonAdulto setSelected:false];
    [self.botonNino setSelected:true];
    nacido = false;
    nino = true;
    adulto = false;
}

- (IBAction)botonAdulto:(id)sender {
    [self.botonNacido setSelected:false];
    [self.botonAdulto setSelected:true];
    [self.botonNino setSelected:false];
    nacido = false;
    nino = false;
    adulto = true;
}


#pragma mark PickerWheel Control

- (int)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _pickerData.count;
}

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return _pickerData[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    temp = [[_pickerData objectAtIndex:row] floatValue];
}


#pragma mark TableView Control

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    UISwitch *switchview = [[UISwitch alloc] initWithFrame:CGRectZero];
    switch (indexPath.row) {
        case 0:
            [switchview setOn:hemorragia animated:NO];
            break;
        case 1:
            [switchview setOn:quemadura animated:NO];
            break;
        case 2:
            [switchview setOn:alergia animated:NO];
            break;
        case 3:
            [switchview setOn:fractura animated:NO];
            break;
        case 4:
            [switchview setOn:trasladar animated:NO];
            break;
    }
    cell.accessoryView = switchview;
    [switchview addTarget:self action:@selector(updateSwitchAtIndexPath:)
         forControlEvents:UIControlEventValueChanged];
    [switchview setTag:indexPath.row];
    cell.textLabel.text = [_tableData objectAtIndex:indexPath.row];
    cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backgroundTexture.png"]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)updateSwitchAtIndexPath:(id)sender {
    //    NSLog(@"%ld", (long)[sender tag]);
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[sender tag] inSection:0];
    UITableViewCell *cell = [self.tablePadecimientos cellForRowAtIndexPath:indexPath];
    UISwitch *switchView = (UISwitch *)cell.accessoryView;
    
    if ([switchView isOn]) {
        switch (indexPath.row) {
            case 0:
                hemorragia=true;
                break;
            case 1:
                quemadura=true;
                break;
            case 2:
                alergia=true;
                break;
            case 3:
                fractura=true;
                break;
            case 4:
                trasladar=true;
                break;
        }
    } else {
        switch (indexPath.row) {
            case 0:
                hemorragia=false;
                break;
            case 1:
                quemadura=false;
                break;
            case 2:
                alergia=false;
                break;
            case 3:
                fractura=false;
                break;
            case 4:
                trasladar=false;
                break;
        }
    }
}

- (IBAction)botonEvaluar:(id)sender {
    if (nacido && (hemorragia || fractura || quemadura || alergia)) {
        message = [[UIAlertView alloc] initWithTitle:@"Emergencia"
                                             message:@"Debes de llevar al recien nacido a un centro de Salud"
                                            delegate:self
                                   cancelButtonTitle:@"Apple Maps"
                                   otherButtonTitles:@"Google Maps",nil];
        [self determinarCSCercana];
        [message show];
    }
    else if (nacido && temp>=38){
        message = [[UIAlertView alloc] initWithTitle:@"Emergencia"
                                             message:@"Debes de llevar al recien nacido a un centro de Salud"
                                            delegate:self
                                   cancelButtonTitle:@"Apple Maps"
                                   otherButtonTitles:@"Google Maps",nil];
        [self determinarCSCercana];
        [message show];;
    }
    else if (nacido && temp>=36.5){
        NSLog(@"Consejos");
    }
    else if (nino && temp==38){
        [self determinarCSCercana];
        UIAlertView *mensajeLlamar =[[UIAlertView alloc] initWithTitle:@"Precaución"
                                                               message:[NSString stringWithFormat:@"Debes de llamar al Centro de Salud %@ para pedir consejo", sucursalCercana.nombre]
                                                              delegate:self
                                                     cancelButtonTitle:@"Llamar"
                                                     otherButtonTitles:nil];
        sucursalCercana.telefono=[sucursalCercana.telefono
                                  stringByReplacingOccurrencesOfString:@" " withString:@""];
        sucursalCercana.telefono=[sucursalCercana.telefono
                                  stringByReplacingOccurrencesOfString:@"(" withString:@""];
        sucursalCercana.telefono=[sucursalCercana.telefono
                                  stringByReplacingOccurrencesOfString:@")" withString:@""];
        sucursalCercana.telefono=[sucursalCercana.telefono
                                  stringByReplacingOccurrencesOfString:@"-" withString:@""];
        [mensajeLlamar show];
    }
    else if (nino && temp>=38.5){
        [self determinarCSCercana];
        message = [[UIAlertView alloc] initWithTitle:@"Emergencia"
                                             message:@"Debes de llevar al niño a un centro de Salud"
                                            delegate:self
                                   cancelButtonTitle:@"Apple Maps"
                                   otherButtonTitles:@"Google Maps",nil];
        [message show];
    }
    else if (nino && hemorragia){
        NSLog(@"Consejo");
    }
    else if (nino && ( fractura || quemadura || alergia)){
        message = [[UIAlertView alloc] initWithTitle:@"Emergencia"
                                             message:@"Debes de llevar al niño a un centro de Salud"
                                            delegate:self
                                   cancelButtonTitle:@"Apple Maps"
                                   otherButtonTitles:@"Google Maps",nil];
        [self determinarCSCercana];
        [message show];
    }
    else if (adulto && 37.5<temp && temp<39){
        NSLog(@"Consejos");
    }
    else if (adulto && temp>=39 && trasladar){
        message = [[UIAlertView alloc] initWithTitle:@"Emergencia"
                                             message:@"Debes de llevar al adulto a un centro de Salud"
                                            delegate:self
                                   cancelButtonTitle:@"Apple Maps"
                                   otherButtonTitles:@"Google Maps",nil];
        [self determinarCSCercana];
        [message show];
    }
    else if (adulto && temp>=39 && !trasladar){
        NSLog(@"Llamar 066");
    }
    else if (adulto && (hemorragia || fractura || quemadura || alergia) && trasladar){
        message = [[UIAlertView alloc] initWithTitle:@"Emergencia"
                                             message:@"Debes de llevar al adulto a un centro de Salud"
                                            delegate:self
                                   cancelButtonTitle:@"Apple Maps"
                                   otherButtonTitles:@"Google Maps",nil];
        [self determinarCSCercana];
        [message show];
    }
    else if (adulto && (hemorragia || fractura || quemadura || alergia) && !trasladar){
        NSLog(@"Llamar 066");
    }
    else{
        NSLog(@"NADA");
    }
}

-(void)determinarCSCercana{
    
    CLLocation *sucursal;
    CLLocation *locationA = [[CLLocation alloc] initWithLatitude:ubicacionActual.latitude longitude:ubicacionActual.longitude];
    sucursalCercana = [[CustomAnnotation alloc]init];
    
    //    NSMutableArray *distancias = [[NSMutableArray alloc] init];
    CLLocationDistance distanceA = 0.0, distanceB = 0.0;
    tempSucursal = [tempAnnotations objectAtIndex:0];
    sucursal = [[CLLocation alloc] initWithLatitude:tempSucursal.latitud longitude:tempSucursal.longitud];
    distanceA  = [locationA distanceFromLocation:sucursal];
    sucursalCercana = tempSucursal;
    
    for (int i=1; i<tempAnnotations.count; i++) {
        tempSucursal = [tempAnnotations objectAtIndex:i];
        
        if ([tempSucursal.tipo isEqualToString:@"Centro de Salud"]) {
            sucursal = [[CLLocation alloc] initWithLatitude:tempSucursal.latitud longitude:tempSucursal.longitud];
            distanceB = [locationA distanceFromLocation:sucursal];
            
            if (distanceB<distanceA) {
                distanceA=distanceB;
                sucursalCercana = tempSucursal;
            }
            
        }
        
    }
    
    
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    
    if (currentLocation != nil) {
        ubicacionActual = newLocation.coordinate;
    }
}

-(void)timerFired:(NSTimer *) theTimer
{
    [locationManager stopUpdatingLocation];
}


- (void) alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex {
    if ([alertView.title isEqualToString:@"Emergencia"]) {
        CLLocationCoordinate2D rdOfficeLocation = CLLocationCoordinate2DMake(sucursalCercana.latitud, sucursalCercana.longitud);
        if (buttonIndex==0) {
            //Apple Maps, using the MKMapItem class
            MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:rdOfficeLocation addressDictionary:nil];
            MKMapItem *item = [[MKMapItem alloc] initWithPlacemark:placemark];
            item.name = sucursalCercana.nombre;
            [item openInMapsWithLaunchOptions:nil];
        } else if (buttonIndex==1) {
            //Google Maps
            //construct a URL using the comgooglemaps schema
            NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"comgooglemaps://?center=%f,%f",rdOfficeLocation.latitude,rdOfficeLocation.longitude]];
            if (![[UIApplication sharedApplication] canOpenURL:url]) {
                UIAlertView *messageError = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                       message:@"No se encontro la app Google Maps instalada."
                                                                      delegate:self
                                                             cancelButtonTitle:@"Ok"
                                                             otherButtonTitles:nil];
                [messageError show];
                
                //left as an exercise for the reader: open the Google Maps mobile website instead!
                
            } else {
                [[UIApplication sharedApplication] openURL:url];
            }
        }
    }
    else if ([alertView.title isEqualToString:@"Precaución"]){
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:sucursalCercana.telefono]];
    }
}

@end
