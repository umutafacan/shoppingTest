//
//  ProductDetailViewController.m
//  shoppingTest
//
//  Created by umut on 27/02/15.
//  Copyright (c) 2015 SmartClick. All rights reserved.
//

#import "ProductDetailViewController.h"

@interface ProductDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelProductName;
@property (weak, nonatomic) IBOutlet UILabel *labelProductId;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewProduct;
@property (weak, nonatomic) IBOutlet UIButton *buttonTest;

@end

@implementation ProductDetailViewController
- (IBAction)testPurchase:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Shopping Test" message:@"SatınAlma Gerçekleşti" delegate:self cancelButtonTitle:@"Tamam" otherButtonTitles: nil];
    [alert show];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated
{
    if (_productName ) {
        _labelProductName.text=_productName;
    }
    
        _labelProductId.text = [NSString stringWithFormat:@"%d",_productID];
        _imageViewProduct.image = [UIImage imageNamed:[NSString stringWithFormat:@"image%d",_productID]];
    
    _buttonTest.layer.cornerRadius = 2.0f;
    _buttonTest.layer.borderColor = (__bridge CGColorRef)([UIColor blackColor]);
    _buttonTest.layer.borderWidth = 5.0f;
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
