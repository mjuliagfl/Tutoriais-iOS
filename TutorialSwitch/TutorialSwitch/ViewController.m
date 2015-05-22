//
//  ViewController.m
//  TutorialSwitch
//
//  Created by Maria Julia Godoy on 20/05/15.
//  Copyright (c) 2015 Maria Julia Godoy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSMutableArray *saveStates;
}
@property (weak, nonatomic) IBOutlet UITableView *myTable;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    saveStates = [[NSMutableArray alloc] init];
    
    for(int i = 0; i < 30; i++){
        [saveStates addObject:@"off"];
    
    }
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 30;
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UISwitch *mySwitch = [[UISwitch alloc] initWithFrame:CGRectZero];
    
    CGRect frame = mySwitch.frame;
    frame.origin.x = 320;
    frame.origin.y = 7;
    mySwitch.frame = frame;
    
    [mySwitch addTarget:self action:@selector(changedState: ) forControlEvents:UIControlEventValueChanged];
    
    
    UITableViewCell* cell = [[UITableViewCell alloc] init];
    
    [cell.contentView addSubview:mySwitch];
    
    if([[saveStates objectAtIndex:indexPath.row] isEqualToString:@"on"]){
        mySwitch.on = YES;
    }
    else{
        mySwitch.on = NO;
    }
    
    
    
    
    cell.textLabel.text = [NSString stringWithFormat:@"Cell number %ld", (indexPath.row + 1)];
    
    
    return cell;
}

-(void) changedState: (UISwitch *) sender {
    UITableViewCell *parent = (UITableViewCell *) [[sender superview] superview];
    
    NSIndexPath *switchIndex = [self.myTable indexPathForCell:parent];
    
    if(sender.on){
        [saveStates replaceObjectAtIndex:switchIndex.row withObject:@"on"];
        
    }
    else{
        [saveStates replaceObjectAtIndex:switchIndex.row withObject:@"off"];
    }

}



@end
