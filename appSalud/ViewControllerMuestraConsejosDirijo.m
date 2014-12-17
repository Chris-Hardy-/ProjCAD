//
//  ViewControllerMuestraConsejosDirijo.m
//  appSalud
//
//  Created by Christopher Hardy on 12/16/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import "ViewControllerMuestraConsejosDirijo.h"
#import "indice_consejo.h"
@interface ViewControllerMuestraConsejosDirijo (){
    NSMutableArray *arrayConsejos;
    indice_consejo *auxConsejo;
}

@end

@implementation ViewControllerMuestraConsejosDirijo

@synthesize pickerSeleccionaConsejo, labelTitulo, textFieldConsejo;

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
    arrayConsejos = [[NSMutableArray alloc] init];
    auxConsejo = [[indice_consejo alloc] init];
    
    self.title = @"Consejos";
    [self.textFieldConsejo setFont:[UIFont fontWithName:@"Antipasto" size:18.0]];
    [self.labelTitulo setFont:[UIFont fontWithName:@"Antipasto" size:18.0]];
    
    auxConsejo.titulo = @"¿Qué hacer si alguien tiene una hemorragia?";
    auxConsejo.texto = @"1.	Lo más importante es detener la hemorragia, poniendo en alto la extremidad afectada y haciendo presión firme sobre la herida en forma sostenida hasta que pare el sangrado. Si el sangrado persistiera o fuera abundante se debería hacer presión digital sobre el vaso sanguineo lesionado o al hacer un torniquete en caso de que la lesión fuera en uno de los miembros y la hemorragia fuera muy profusa (un torniquete no debe durar más de 15 minutos, porque se corre el riesgo de inutilizar el miembro y en vez de ayudar agravaríamos al paciente).\n\n2.	Evitar que el afectado llegue al shock acostando al herido con la cabeza más abajo de los pies, si la hemorragia es intensa.\n\n3.	Saber que todo manipulación de una herida debe hacerse con las manos limpias, y material estéril, para evitar una posterior infección.\n\n4.	Si el sangrado es abundante y no deja de parar llamar inmediatamente a un servicio de urgencia.";
    [arrayConsejos addObject:auxConsejo];
    auxConsejo = [[indice_consejo alloc] init];
    auxConsejo.titulo = @"Medidas para evitar las heridas y hemorragias:";
    auxConsejo.texto = @"•	Utilizar adecuadamente los elementos caseros de acuerdo con su función, por ejemplo, No utilizar el cuchillo como destornillador.\n\n•	No utilizar herramientas y artefactos de los que se desconoce su manejo y funcionamiento. Es indispensable leer las instrucciones que acompañan a éstos artefactos.\n\n•	Los elementos afilados, dentados, puntudos deben ser manejados con las partes que pueden herir en dirección contraria al cuerpo y no deben dejarse al alcance de los niños.\n\n•	No permitir que los niños corran con objetos que puedan lesionarlos como varillas, palos, botellas, cuchillos tijeras o lápices.\n\n•	Retirar adecuadamente y a un lugar seguro objetos rotos como Platos, vasos, etc.";
    [arrayConsejos addObject:auxConsejo];
    auxConsejo = [[indice_consejo alloc] init];
    auxConsejo.titulo = @"¿Qué hacer si alguien tiene una fractura?";
    auxConsejo.texto = @"Primero verificar si tiene alguna hemorragia concomitante y tratarla. Es muy raro que un accidente del hogar te cause hemorragia abundante. Lo segundo que debo hacer es evitar que el paciente se mueva para calmar su dolor, para ello inmovilizamos el miembro afectado con una férula. Si no sabemos cómo actuar es preferible no hacer nada.\n\nMedidas para evitar las caídas, fracturas, esguinces y luxaciones:\n\n•	Evitar que en el piso haya elementos en desorden, la limpieza debe hacerse con sustancias antideslizantes para prevenir accidentes.\n\n•	Evitar que los niños jueguen en las escaleras.\n\n•	Conocer y practicar medidas de prevención para evitar la osteoporosis: dietas ricas en calcio, actividad física, no consumo de sustancias psicoactivas.\n\n•	Ayudar a los ancianos o impedidos físicos, a bajar escaleras, o subir peldaños.";
    [arrayConsejos addObject:auxConsejo];
    auxConsejo = [[indice_consejo alloc] init];
    auxConsejo.titulo = @"¿Qué hacer si me quemo?";
    auxConsejo.texto = @"1.	Apartar al accidentado de la fuente de calor. Si su ropa estuviera en llamas tratar de apagar el fuego con una manta o hacerle rodar en el suelo.\n\n2.	Calmar el dolor inmediatamente, sumergiendo la parte afectada del herido o al herido (según sea el caso) en agua fría durante un mínimo de 10 minutos (nunca sumergir en otro tipo de líquidos, ni en agua helada).\n\n3.	Retirarle la ropa de la zona afectada con mucho cuidado, si esta adherida, no hacerlo, dejarlo para que lo hagan en el hospital.\n\n4.	 No aplicar sobre las quemaduras: pomadas, lociones, aceites, pasta de dientes, agua helada, etc. Ni tampoco usar sobre ellas algodón, ni apósitos adhesivos. Tampoco se debe reventar las ampollas producidas por la quemadura. Estas pueden agravar las quemaduras.\n\nLas quemaduras que necesitan hospitalización son:\n\n•	Las que tienen una gran extensión\n\n•	Quemaduras en cara, manos, pies o genitales\n\n•	Las quemaduras que son de segundo y tercer grado (profundas)\n\n•	Las quemaduras en niños menores de 2 años, o en mayores de 70 años.\n\nMedidas para evitar las quemaduras e incendios:\n\n•	Impedir a los niños que jueguen en la cocina, y al momento de que se están manipulando líquidos calientes.\n\n•	Instalar un detector de humo con alarma en cada piso de la casa.\n\n•	Tener un extinguidor, saber cómo usarlo, y haberlo practicado.\n\n•	No sobrecargar los enchufes eléctricos.\n\n•	Mantener encendedores y fósforos fuera del alcance de los niños. No estimular su curiosidad con estos elementos.\n\n•	Al vaciar los ceniceros, chequear que su contenido esté perfectamente apagado.\n\n•	No fumar en la cama. Es una causa importante de muerte por incendios en el domicilio. Alejar las estufas hasta al menos 1 metro de la cama. No secar vestimentas o calzado sobre ellas.\n\n•	Tener precaución al usar velas.";
    auxConsejo = [[indice_consejo alloc] init];
    
    self.pickerSeleccionaConsejo.delegate = self;
    self.pickerSeleccionaConsejo.dataSource = self;
    
    auxConsejo = [arrayConsejos objectAtIndex:0];
    
    self.labelTitulo.text = auxConsejo.titulo;
    self.textFieldConsejo.text = auxConsejo.texto;
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

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel* tView = (UILabel*)view;
    if (!tView)
    {
        tView = [[UILabel alloc] init];
        [tView setFont: [UIFont fontWithName:@"Antipasto" size:18.0]];
        //[tView setTextAlignment:UITextAlignmentLeft];
    }
    // Fill the label text here
    auxConsejo = [arrayConsejos objectAtIndex:row];
    tView.textAlignment = NSTextAlignmentCenter;
    tView.text=auxConsejo.titulo;
    return tView;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [arrayConsejos count];
    
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    auxConsejo=[arrayConsejos objectAtIndex:row];
    self.textFieldConsejo.text = auxConsejo.texto;
    self.labelTitulo.text = auxConsejo.titulo;
}

//Pragma mark Picker Delegate Methods
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    auxConsejo=[arrayConsejos objectAtIndex:row];
    self.labelTitulo.text = auxConsejo.titulo;
    self.textFieldConsejo.text = auxConsejo.texto;
    return auxConsejo.titulo;
}





@end
