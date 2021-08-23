//
//  ViewController.m
//  CCUIKit
//
//  Created by zjh on 2021/8/20.
//

#import "ViewController.h"
#import "CCColorPicker.h"
@interface ViewController ()
@property (nonatomic,strong) CCColorPicker *colorPicker;
@property (nonatomic,strong) UITextField *text;
@property (nonatomic,strong) UITextField *text1;
@property (nonatomic,strong) UITextField *text2;
@property (nonatomic,strong) UIButton *okBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.colorPicker.frame = CGRectMake(40, 20, 300, 300);
    [self.view addSubview:self.colorPicker];
    [self.view addSubview:self.text];
    [self.view addSubview:self.text1];
    [self.view addSubview:self.text2];
    [self.view addSubview:self.okBtn];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    [self.view addGestureRecognizer:tap];
    // Do any additional setup after loading the view.
}
-(void)tapAction{
    [self.view endEditing:YES];
}
-(void)okAction{
    self.colorPicker.color = [UIColor colorWithRed:[self.text.text floatValue]/255.0 green:[self.text1.text floatValue]/255.0 blue:[self.text2.text floatValue]/255.0 alpha:1];
}
-(CCColorPicker *)colorPicker{
    if (!_colorPicker) {
        _colorPicker = [[CCColorPicker alloc] initWithType:CCColorPickerTypeCircle];
        _colorPicker.ringWidth = 50;
    }
    return _colorPicker;
}
-(UITextField *)text{
    if (!_text) {
        _text = [[UITextField alloc] init];
        _text.layer.borderColor = UIColor.grayColor.CGColor;
        _text.frame = CGRectMake(50, 370, 200, 50);
        _text.layer.borderWidth = 0.5;

    }
    return _text;
}
-(UITextField *)text1{
    if (!_text1) {
        _text1 = [[UITextField alloc] init];
        _text1.layer.borderColor = UIColor.grayColor.CGColor;
        _text1.frame = CGRectMake(50, 440, 200, 50);
        _text1.layer.borderWidth = 0.5;

    }
    return _text1;
}
-(UITextField *)text2{
    if (!_text2) {
        _text2 = [[UITextField alloc] init];
        _text2.layer.borderColor = UIColor.grayColor.CGColor;
        _text2.layer.borderWidth = 0.5;
        _text2.frame = CGRectMake(50, 510, 200, 50);
    }
    return _text2;
}
-(UIButton *)okBtn{
    if (!_okBtn) {
        _okBtn = [[UIButton alloc] init];
        _okBtn.frame = CGRectMake(50, 570, 200, 50);
        [_okBtn setTitle:@"确定" forState:UIControlStateNormal];
        [_okBtn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
        _okBtn.backgroundColor = UIColor.yellowColor;
        [_okBtn addTarget:self action:@selector(okAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _okBtn;
}
@end
