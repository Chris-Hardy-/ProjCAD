//
//  ViewControllerConsejos.h
//  appSalud
//
//  Created by Dulce Beatriz Godinez Guerrero on 11/09/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerConsejos : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>


@property (nonatomic, assign) IBOutlet UIPickerView *myPicker;
@property (weak, nonatomic) NSArray *arrayConsejos;
@property (weak, nonatomic) IBOutlet UITextView *textFieldCuerpo;

@property (weak, nonatomic) IBOutlet UILabel *myLabel;


@end
