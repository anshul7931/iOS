//
//  ViewController.m
//  practical
//
//  Created by Apple52 on 06/04/16.
//  Copyright © 2016 Apple52. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *t1;
@property (weak, nonatomic) IBOutlet UITextField *t2;
@property (weak, nonatomic) IBOutlet UITextView *t3;
@property (weak, nonatomic) IBOutlet UIWebView *webview;
@property (weak, nonatomic) IBOutlet UIButton *b1;
@property (weak, nonatomic) IBOutlet UIButton *login;

@end

@implementation ViewController

- (BOOL)validateEmailWithString:(NSString*)text1
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    // NSLog(@"%@",emailRegex);
    return [emailTest evaluateWithObject:text1];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *url=@"http://www.chitkara.edu.in";
    NSURL *nsurl=[NSURL URLWithString:url];
    NSURLRequest *nsrequest=[NSURLRequest requestWithURL:nsurl];
    [_webview loadRequest:nsrequest];
    
    
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
    
    [_t1 setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [_t2 setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
  
}

- (IBAction)login:(id)sender {
    NSString *text1 = [_t1.text stringByTrimmingCharactersInSet:
                       [NSCharacterSet whitespaceCharacterSet]];
    NSString *text2 = [_t2.text stringByTrimmingCharactersInSet:
                       [NSCharacterSet whitespaceCharacterSet]];
    if(text1.length==0 || text2.length==0 ){
        
        UIAlertView *alert=
        [[UIAlertView alloc]initWithTitle:@"ERROR" message:@"Plz fill all credentials" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if(![self validateEmailWithString:_t1.text]){
        UIAlertView *alert=
        [[UIAlertView alloc]initWithTitle:@"ERROR" message:@"Invalid Email" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (IBAction)b1:(id)sender {
    ViewController *nextview=[self.storyboard instantiateViewControllerWithIdentifier:@"SignIn"];
    [self.navigationController pushViewController:nextview animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
