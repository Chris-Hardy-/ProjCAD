//
//  ViewControllerADondeMeDirijo.h
//  appSalud
//
//  Created by Christopher Hardy on 11/26/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewControllerADondeMeDirijo : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate, UITableViewDataSource, UITableViewDelegate,UIActionSheetDelegate,CLLocationManagerDelegate, UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *botonNacido;
@property (weak, nonatomic) IBOutlet UIButton *botonNino;
@property (weak, nonatomic) IBOutlet UIButton *botonAdulto;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerTemperatura;
@property (weak, nonatomic) IBOutlet UITableView *tablePadecimientos;

@end
