//
//  ViewControllerEncuestas.m
//  appSalud
//
//  Created by Christopher Hardy on 12/16/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import "ViewControllerEncuestas.h"
#import "SWRevealViewController.h"
#import "encuesta.h"

@interface ViewControllerEncuestas ()

@end

@implementation ViewControllerEncuestas{
    NSArray *tableData;
    encuesta *tempEncuesta;
    NSMutableArray *tempRespuestas;
}
@synthesize tablaEncuesta=_tablaEncuesta;

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
    
    self.title=@"Encuesta";
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    UIImage *menu = [UIImage imageNamed:@"menu.png"];
    
    UIBarButtonItem *flipButton = [[UIBarButtonItem alloc]
                                   initWithImage:menu style:UIBarButtonItemStyleBordered target:self.revealViewController action:@selector(revealToggle:)];
    self.navigationItem.leftBarButtonItem = flipButton;
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backgroundTexture.png"]];
    
    NSUserDefaults *userDefaults = [[NSUserDefaults alloc] init];
    NSData *arrayData = [userDefaults objectForKey:@"arrayEncuestas"];
    tableData = [NSKeyedUnarchiver unarchiveObjectWithData:arrayData];
    NSString *respuesta;
    respuesta=@"no";
    

    
    tempEncuesta = [tableData objectAtIndex:0];
    
    tempRespuestas = [[NSMutableArray alloc] init];
    tableData = [NSArray arrayWithArray:[NSKeyedUnarchiver unarchiveObjectWithData:tempEncuesta.arrayData]];
    
    for (int i=0; i<[tableData count]; i++) {
        [tempRespuestas addObject:respuesta];
    }
    
    self.tablaEncuesta.delegate = self;
    self.tablaEncuesta.dataSource = self;
    self.labelTitulo.text = tempEncuesta.nombre;
    
    self.tablaEncuesta.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backgroundTexture.png"]];
//    self.tablaEncuesta.backgroundVie
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"Cell";
    NSString *tempResp = [tempRespuestas objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    UISwitch *switchview = [[UISwitch alloc] initWithFrame:CGRectZero];
    cell.accessoryView = switchview;
    [switchview addTarget:self action:@selector(updateSwitchAtIndexPath:)
         forControlEvents:UIControlEventValueChanged];
    [switchview setTag:indexPath.row];
    cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
    
    if ([tempResp isEqualToString:@"si"]) {
        [switchview setOn:true animated:NO];
    }
    else
        [switchview setOn:false animated:NO];
    
    cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backgroundTexture.png"]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

- (void)updateSwitchAtIndexPath:(id)sender {
    //    NSLog(@"%ld", (long)[sender tag]);
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[sender tag] inSection:0];
    NSString *tempResp = [tempRespuestas objectAtIndex:indexPath.row];
    
    UITableViewCell *cell = [self.tablaEncuesta cellForRowAtIndexPath:indexPath];
    UISwitch *switchView = (UISwitch *)cell.accessoryView;
    
    if ([switchView isOn]) {
        tempResp = @"si";
        [tempRespuestas replaceObjectAtIndex:indexPath.row withObject:tempResp];
        
    } else {
        tempResp = @"no";
        [tempRespuestas replaceObjectAtIndex:indexPath.row withObject:tempResp];
    }
}

- (IBAction)enviarEncuesta:(id)sender {
    NSString *myRequestString;
    NSString *temp=@"";
    for (int i=0; i<[tempRespuestas count]; i++) {
        
        if (i==0) {
            if ([[tempRespuestas objectAtIndex:i] isEqualToString:@"si"]) {
                temp = [temp stringByAppendingString:@"si"];
            }
            else
                temp = [temp stringByAppendingString:@"no"];

        }
        else {
        
        if ([[tempRespuestas objectAtIndex:i] isEqualToString:@"si"]) {
            temp = [temp stringByAppendingString:@",si"];
        }
        else
            temp = [temp stringByAppendingString:@",no"];
        }
    }
        myRequestString = [[NSString alloc] initWithFormat:@"http://192.168.1.159:8888/ConfigAppiOS/procesaRespuestas.php?idencuesta=%@&respuestas=%@",tempEncuesta.idEncuesta, temp];

    NSURL *url = [[NSURL alloc] init];
    url = [NSURL URLWithString:myRequestString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        if (!error) {
            NSLog(@"GET REALIZADO");
            UIAlertView *message;
            message = [[UIAlertView alloc] initWithTitle:@"Exito"
                                                 message:@"Los datos fueron envidos correctamente"
                                                delegate:self
                                       cancelButtonTitle:@"Ok"
                                       otherButtonTitles:nil];
            [message show];            }
        else
            NSLog(@"%@", error);
    }];
    
 
    
    
}

@end
