//
//  ViewController.m
//  shoppingTest
//
//  Created by umut on 27/02/15.
//  Copyright (c) 2015 SmartClick. All rights reserved.
//
#import "ViewController.h"
#import "ProductDetailViewController.h"
@interface ViewController ()

@property (nonatomic,strong) NSMutableArray *arrayProducts;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _arrayProducts =[[NSMutableArray alloc]initWithObjects:@"TV",@"Phone",@"TabletPC",@"Laptop",nil];
    _tableView.delegate = self;
    [_tableView reloadData];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushPageWithNotification) name:@"DEEPLINK" object:nil];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated
{
    if ([[STSingleton sharedInstance] getIsPushTriggered] && ![[STSingleton sharedInstance] getIsAppOpened] ) {
        
        [self pushPageWithNotification];
    }
    [[STSingleton sharedInstance] setIsAppOpened:YES];
    [[STSingleton sharedInstance] setIsPushTriggered:NO];
    
}

-(void)pushPageWithNotification
{
    
    if (self.navigationController.viewControllers.count > 1 ) {
        [self.navigationController  popToRootViewControllerAnimated:YES];
    }

    
    
    NSString *idString = [[STSingleton sharedInstance] getElementFromUrlDictWithKey:@"id"];
    int idNumber = [idString intValue];
    NSString *name = [_arrayProducts objectAtIndex:idNumber];
    [self pushToProductDetailWithName:name ID:idNumber];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma Mark - TableView Delegates

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"productCellIdentifier"];
    
    /*
     *   If the cell is nil it means no cell was available for reuse and that we should
     *   create a new one.
     */
    if (cell == nil) {
        
        /*
         *   Actually create a new cell (with an identifier so that it can be dequeued).
         */
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"productCellIdentifier"] ;
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    
    /*
     *   Now that we have a cell we can configure it to display the data corresponding to
     *   this row/section
     */
    
    NSString *itemName = [self.arrayProducts objectAtIndex:indexPath.row];
    cell.textLabel.text = itemName;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self pushToProductDetailWithName:[_arrayProducts objectAtIndex:indexPath.row] ID:(int) indexPath.row];

}
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return _arrayProducts.count;
}
-(void)pushToProductDetailWithName:(NSString *)name ID:(int)ID
{
    
    
    [[STSingleton sharedInstance] setIsPushTriggered:NO];
    if (ID >= _arrayProducts.count || ID < 0) {
        return;
    }
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ProductDetailViewController *pVC = (ProductDetailViewController *)[storyboard instantiateViewControllerWithIdentifier:@"ProductDetailViewController"];;
    pVC.productName=name;
    pVC.productID=ID;
    [self.navigationController pushViewController:pVC animated:YES];
        
}

@end
