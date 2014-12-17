//
//  ViewControllerMuestraConsejosDirijo.h
//  appSalud
//
//  Created by Christopher Hardy on 12/16/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerMuestraConsejosDirijo : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *pickerSeleccionaConsejo;

@property (weak, nonatomic) IBOutlet UILabel *labelTitulo;
@property (weak, nonatomic) IBOutlet UITextView *textFieldConsejo;
@end
