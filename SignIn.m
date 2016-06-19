//
//  SignIn.m
//  practical
//
//  Created by Apple52 on 11/04/16.
//  Copyright © 2016 Apple52. All rights reserved.
//

#import "SignIn.h"

@interface SignIn ()
@property (weak, nonatomic) IBOutlet UITextField *t1;
@property (weak, nonatomic) IBOutlet UITextField *t2;
@property (weak, nonatomic) IBOutlet UITextField *t3;
@property (weak, nonatomic) IBOutlet UITextField *t4;
@property (weak, nonatomic) IBOutlet UITextField *t5;
@property (weak, nonatomic) IBOutlet UIButton *b1;
@property (weak, nonatomic) IBOutlet UIScrollView *scroll;
@property (weak, nonatomic) IBOutlet UIImageView *img1;
@property (weak, nonatomic) IBOutlet UIButton *back;
@property (weak, nonatomic) IBOutlet UIImageView *img2;
@property (weak, nonatomic) IBOutlet UIImageView *img3;
@property (weak, nonatomic) IBOutlet UIImageView *img4;
@property (weak, nonatomic) IBOutlet UIImageView *img5;
@property (weak, nonatomic) IBOutlet UILabel *l1;
@property (weak, nonatomic) IBOutlet UILabel *l2;
@property (weak, nonatomic) IBOutlet UILabel *l3;
@property (weak, nonatomic) IBOutlet UILabel *l4;

@end

@implementation SignIn

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CALayer *border = [CALayer layer];
    CGFloat borderWidth = 2;
    border.borderColor = [UIColor whiteColor].CGColor;
    border.frame = CGRectMake(0, _t1.frame.size.height - borderWidth, _t1.frame.size.width, _t1.frame.size.height);
    border.borderWidth = borderWidth;
    [_t1.layer addSublayer:border];
    _t1.layer.masksToBounds = YES;
    
    CALayer *border1 = [CALayer layer];
    CGFloat borderWidth1 = 2;
    border1.borderColor = [UIColor whiteColor].CGColor;
    border1.frame = CGRectMake(0, _t2.frame.size.height - borderWidth1, _t2.frame.size.width, _t2.frame.size.height);
    border1.borderWidth = borderWidth1;
    [_t2.layer addSublayer:border1];
    _t2.layer.masksToBounds = YES;

    CALayer *border2 = [CALayer layer];
    CGFloat borderWidth2 = 2;
    border2.borderColor = [UIColor whiteColor].CGColor;
    border2.frame = CGRectMake(0, _t3.frame.size.height - borderWidth2, _t3.frame.size.width, _t3.frame.size.height);
    border2.borderWidth = borderWidth2;
    [_t3.layer addSublayer:border2];
    _t3.layer.masksToBounds = YES;
    
    CALayer *border3 = [CALayer layer];
    CGFloat borderWidth3 = 2;
    border3.borderColor = [UIColor whiteColor].CGColor;
    border3.frame = CGRectMake(0, _t4.frame.size.height - borderWidth3, _t4.frame.size.width, _t4.frame.size.height);
    border3.borderWidth = borderWidth3;
    [_t4.layer addSublayer:border3];
    _t4.layer.masksToBounds = YES;

    CALayer *border4 = [CALayer layer];
    CGFloat borderWidth4 = 2;
    border4.borderColor = [UIColor whiteColor].CGColor;
    border4.frame = CGRectMake(0, _t5.frame.size.height - borderWidth4, _t5.frame.size.width, _t5.frame.size.height);
    border4.borderWidth = borderWidth4;
    [_t5.layer addSublayer:border4];
    _t5.layer.masksToBounds = YES;
    
    _l1.hidden=YES;
    _l2.hidden=YES;
    _l3.hidden=YES;
    _l4.hidden=YES;
    
    
    _scroll.contentSize=CGSizeMake(0,300);
    
}
- (IBAction)back:(id)sender {
    SignIn *nextview=[self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    [self.navigationController pushViewController:nextview animated:YES];
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if (_t1.text.length > 1 || (text.length > 0 && ![text isEqualToString:@""]))
    {
        self.b1.enabled = YES;
    }
    else
    {
        self.b1.enabled = NO;
    }
    
    return YES;
}

- (BOOL)validateEmailWithString:(NSString*)text1
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    // NSLog(@"%@",emailRegex);
    return [emailTest evaluateWithObject:text1];
}

- (BOOL)validateNameWithString:(NSString*)text2
{
    NSString *numRegex = @"[A-Za-z]{2,20}";
    NSPredicate *numTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numRegex];
    
    
    return [numTest evaluateWithObject:text2];
}

- (IBAction)b1:(id)sender {
    NSString *text1 = [_t1.text stringByTrimmingCharactersInSet:
                       [NSCharacterSet whitespaceCharacterSet]];
    
    NSString *text2=[_t2.text stringByTrimmingCharactersInSet:
                     [NSCharacterSet whitespaceCharacterSet]];
    
    NSString *text3 = [_t3.text stringByTrimmingCharactersInSet:
                       [NSCharacterSet whitespaceCharacterSet]];
    
    NSString *text4 = [_t4.text stringByTrimmingCharactersInSet:
                       [NSCharacterSet whitespaceCharacterSet]];
    
    NSString *text5 = [_t5.text stringByTrimmingCharactersInSet:
                       [NSCharacterSet whitespaceCharacterSet]];
    
    if(text1.length==0 || text2.length==0 || text3.length==0 || text4.length==0 || text5.length==0 )
    {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"ERROR"
                                                                       message:@"Empty Credentials"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
        _img1.hidden=YES;
        _img2.hidden=YES;
        _img3.hidden=YES;
        _img4.hidden=YES;
        _img5.hidden=YES;
        _l1.hidden=YES;
        _l2.hidden=YES;
        _l3.hidden=YES;
        _l4.hidden=YES;
        //_img1.image=[UIImage imageNamed:@"logo"];
    }
    //else{
    if(![self validateEmailWithString:_t3.text]){
        _img3.hidden=NO;
        _img3.image=[UIImage imageNamed:@"cross_icon"];
        
        _l3.hidden=NO;
    }
    else {
        _l3.hidden=YES;
        _img3.hidden=NO;
        _img3.image=[UIImage imageNamed:@"tick_icon"];
    }
    if (![self.t4.text isEqualToString:self.t5.text]){
        _img5.hidden=NO;
        _img5.image=[UIImage imageNamed:@"cross_icon"];
        _l4.hidden=NO;
    }
    else {
        _l4.hidden=YES;
        _img5.hidden=NO;
        _img5.image=[UIImage imageNamed:@"tick_icon"];
    }
    
    if([self validateNameWithString:_t1.text]){
        _img1.hidden=NO;
        _img1.image=[UIImage imageNamed:@"tick_icon"];
        _l1.hidden=YES;
    }
    else {
        _img1.hidden=NO;
        _img1.image=[UIImage imageNamed:@"cross_icon"];
        _l1.hidden=NO;
    }
    if([self validateNameWithString:_t2.text]){
        _img2.hidden=NO;
        _img2.image=[UIImage imageNamed:@"tick_icon"];
        _l2.hidden=YES;
    }
    else {
        _img2.hidden=NO;
        _img2.image=[UIImage imageNamed:@"cross_icon"];
        _l2.hidden=NO;
   //   }
    }
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
