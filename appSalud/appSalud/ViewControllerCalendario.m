//
//  ViewControllerCalendario.m
//  appSalud
//
//  Created by Christopher Hardy on 10/14/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import "DSLCalendarView.h"
#import "ViewControllerCalendario.h"
#import "SWRevealViewController.h"
#import "evento.h"
#import <EventKit/EventKit.h>

@interface ViewControllerCalendario () <DSLCalendarViewDelegate>{
    NSArray *tableData;
    evento *tempEvento;
}

@property (nonatomic, weak) IBOutlet DSLCalendarView *calendarView;

@end

@implementation ViewControllerCalendario

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.title=@"Calendario";
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    UIImage *menu = [UIImage imageNamed:@"menu.png"];
    
    UIBarButtonItem *flipButton = [[UIBarButtonItem alloc]
                                   initWithImage:menu style:UIBarButtonItemStyleBordered target:self.revealViewController action:@selector(revealToggle:)];
    self.navigationItem.leftBarButtonItem = flipButton;
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backgroundTexture.png"]];
    
    
    self.calendarView.delegate = self;
    self.calendarView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backgroundTexture.png"]];
    
    NSUserDefaults *userDefaults = [[NSUserDefaults alloc] init];
    NSData *arrayData = [userDefaults objectForKey:@"arrayEventos"];
    tableData = [NSKeyedUnarchiver unarchiveObjectWithData:arrayData];
    
    self.tableEventos.dataSource = self;
    self.tableEventos.delegate = self;
    
    
    
    
    //    NSDateComponents *startDate = [[NSDateComponents alloc] init];
    //    NSDateComponents *endDate = [[NSDateComponents alloc] init];
    //
    //    startDate.year=2014;
    //    startDate.month=12;
    //    startDate.day=12;
    //
    //    endDate.year=2014;
    //    endDate.month=12;
    //    endDate.day=13;
    
    //    NSString *dateString = @"03-Sep-11";
    //    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //    dateFormatter.dateFormat = @"dd-MMM-yy";
    //    NSDate *date = [dateFormatter dateFromString:dateString];
    //
    //    DSLCalendarRange *selected = [[DSLCalendarRange alloc] initWithStartDay:date endDay:date];
    //
    //    [self.calendarView setSelectedRange: selected];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


#pragma mark - DSLCalendarViewDelegate methods

- (void)calendarView:(DSLCalendarView *)calendarView didSelectRange:(DSLCalendarRange *)range {
    if (range != nil) {
        NSLog( @"Selected %ld/%ld - %ld/%ld", (long)range.startDay.day, (long)range.startDay.month, (long)range.endDay.day, (long)range.endDay.month);
    }
    else {
        NSLog( @"No selection" );
    }
}

- (DSLCalendarRange*)calendarView:(DSLCalendarView *)calendarView didDragToDay:(NSDateComponents *)day selectingRange:(DSLCalendarRange *)range {
    if (NO) { // Only select a single day
        return [[DSLCalendarRange alloc] initWithStartDay:day endDay:day];
    }
    else if (NO) { // Don't allow selections before today
        NSDateComponents *today = [[NSDate date] dslCalendarView_dayWithCalendar:calendarView.visibleMonth.calendar];
        
        NSDateComponents *startDate = range.startDay;
        NSDateComponents *endDate = range.endDay;
        
        if ([self day:startDate isBeforeDay:today] && [self day:endDate isBeforeDay:today]) {
            return nil;
        }
        else {
            if ([self day:startDate isBeforeDay:today]) {
                startDate = [today copy];
            }
            if ([self day:endDate isBeforeDay:today]) {
                endDate = [today copy];
            }
            
            return [[DSLCalendarRange alloc] initWithStartDay:startDate endDay:endDate];
        }
    }
    return range;
}

- (void)calendarView:(DSLCalendarView *)calendarView willChangeToVisibleMonth:(NSDateComponents *)month duration:(NSTimeInterval)duration {
    NSLog(@"Will show %@ in %.3f seconds", month, duration);
}

- (void)calendarView:(DSLCalendarView *)calendarView didChangeToVisibleMonth:(NSDateComponents *)month {
    NSLog(@"Now showing %@", month);
}

- (BOOL)day:(NSDateComponents*)day1 isBeforeDay:(NSDateComponents*)day2 {
    return ([day1.date compare:day2.date] == NSOrderedAscending);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
    
    //Funcion para ocultar la tableviewVacantes dando click en la pantalla
}

#pragma mark TableViewControlls

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"celdaEventos"];
    tempEvento = [tableData objectAtIndex:indexPath.row];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"celdaEventos"];
    }
    cell.textLabel.text = tempEvento.titulo;
    cell.detailTextLabel.text = tempEvento.descripcion;
    
    return cell;
    
    return nil;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    tempEvento = [tableData objectAtIndex:indexPath.row];
    
    NSDateFormatter *dateFormatter;
    NSDate *capturedStartDate;
    
    dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:6]];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"es_ES"]];
    
    capturedStartDate = [dateFormatter dateFromString:tempEvento.fecha];
    NSLog(@"Captured Date %@", [capturedStartDate description]);
    
    
    EKEventStore *store = [[EKEventStore alloc] init];
    [store requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error) {
        if (!granted) { return; }
        EKEvent *event = [EKEvent eventWithEventStore:store];
        event.title = tempEvento.titulo;
        event.startDate = capturedStartDate; //today
        event.endDate = [event.startDate dateByAddingTimeInterval:60*60];  //set 1 hour meeting
        [event setCalendar:[store defaultCalendarForNewEvents]];
        NSError *err = nil;
        [store saveEvent:event span:EKSpanThisEvent commit:YES error:&err];
    }];
    

    
//    comps = [cal components:(NSYearCalendarUnit  | NSMonthCalendarUnit | NSDayCalendarUnit) fromDate:tempEvento.fecha];
    
    [self showCalendarOnDate:capturedStartDate];
    
//    [self showCalendarOnDate:[cal dateFromComponents:comps]];
}

- (void)showCalendarOnDate:(NSDate *)date
{
    // calc time interval since 1 January 2001, GMT
    NSInteger interval = [date timeIntervalSinceReferenceDate];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"calshow:%ld", (long)interval]];
    [[UIApplication sharedApplication] openURL:url];
}



@end