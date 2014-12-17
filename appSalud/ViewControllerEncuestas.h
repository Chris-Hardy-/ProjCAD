//
//  ViewControllerEncuestas.h
//  appSalud
//
//  Created by Christopher Hardy on 12/16/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerEncuestas : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tablaEncuesta;
@property (weak, nonatomic) IBOutlet UILabel *labelTitulo;

@end
