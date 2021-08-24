//
//  ViewController.m
//  CCUIKit
//
//  Created by zjh on 2021/8/20.
//

#import "ViewController.h"
#import "CCColorPicker.h"
@interface ViewController ()<UIGestureRecognizerDelegate>{
    CGFloat __width;
}
@property (nonatomic,strong) CCColorPicker *colorPicker;
@property (nonatomic,strong) CCColorPicker *ringPicker;

@property (nonatomic,strong) UITextField *text;
@property (nonatomic,strong) UITextField *text1;
@property (nonatomic,strong) UITextField *text2;
@property (nonatomic,strong) UIButton *okBtn;
@property (nonatomic,strong) UIButton *changeBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    __width = UIScreen.mainScreen.bounds.size.width;
    self.colorPicker.frame = CGRectMake(50, 40, __width-100, __width-100);
    self.ringPicker.frame = CGRectMake(50, 40, __width-100, __width-100);
    [self.view addSubview:self.colorPicker];
    [self.view addSubview:self.ringPicker];
    [self.view addSubview:self.text];
    [self.view addSubview:self.text1];
    [self.view addSubview:self.text2];
    [self.view addSubview:self.okBtn];
    [self.view addSubview:self.changeBtn];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    tap.delegate = self;
    [self.view addGestureRecognizer:tap];
    // Do any additional setup after loading the view.
}
-(void)tapAction{
    [self.view endEditing:YES];
}
-(void)okAction{
    self.colorPicker.color = [UIColor colorWithRed:[self.text.text floatValue]/255.0 green:[self.text1.text floatValue]/255.0 blue:[self.text2.text floatValue]/255.0 alpha:1];
    self.ringPicker.color = [UIColor colorWithRed:[self.text.text floatValue]/255.0 green:[self.text1.text floatValue]/255.0 blue:[self.text2.text floatValue]/255.0 alpha:1];

}
-(void)changeAction{
    self.colorPicker.hidden = !self.colorPicker.hidden;
    self.ringPicker.hidden = !self.ringPicker.hidden;
}
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    if (touch.view == self.colorPicker || touch.view == self.ringPicker) {
        return NO;
    }
    return YES;
}
-(CCColorPicker *)colorPicker{
    if (!_colorPicker) {
        _colorPicker = [[CCColorPicker alloc] initWithType:CCColorPickerTypeCircle];
        _colorPicker.ringWidth = 50;
    }
    return _colorPicker;
}
-(CCColorPicker *)ringPicker{
    if (!_ringPicker) {
        _ringPicker = [[CCColorPicker alloc] initWithType:CCColorPickerTypeRing];
        _ringPicker.ringWidth = 50;
        _ringPicker.hidden = YES;
    }
    return _ringPicker;
}
-(UITextField *)text{
    if (!_text) {
        _text = [[UITextField alloc] init];
        _text.layer.borderColor = UIColor.grayColor.CGColor;
        _text.frame = CGRectMake((__width-40)/3*0+10, 370, __width/3-10, 40);
        _text.layer.borderWidth = 0.5;

    }
    return _text;
}
-(UITextField *)text1{
    if (!_text1) {
        _text1 = [[UITextField alloc] init];
        _text1.layer.borderColor = UIColor.grayColor.CGColor;
        _text1.frame = CGRectMake((__width-40)/3*1+20, 370, __width/3-10, 40);
        _text1.layer.borderWidth = 0.5;

    }
    return _text1;
}
-(UITextField *)text2{
    if (!_text2) {
        _text2 = [[UITextField alloc] init];
        _text2.layer.borderColor = UIColor.grayColor.CGColor;
        _text2.layer.borderWidth = 0.5;
        _text2.frame = CGRectMake((__width-40)/3*2+30, 370, __width/3-10, 40);
    }
    return _text2;
}
-(UIButton *)okBtn{
    if (!_okBtn) {
        _okBtn = [[UIButton alloc] init];
        _okBtn.frame = CGRectMake(50, 460, (__width - 100), 40);
        [_okBtn setTitle:@"确定" forState:UIControlStateNormal];
        [_okBtn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
        _okBtn.backgroundColor = UIColor.yellowColor;
        [_okBtn addTarget:self action:@selector(okAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _okBtn;
}
-(UIButton *)changeBtn{
    if (!_changeBtn) {
        _changeBtn = [[UIButton alloc] init];
        _changeBtn.frame = CGRectMake(50, 530, (__width - 100), 40);
        [_changeBtn setTitle:@"切换色盘" forState:UIControlStateNormal];
        [_changeBtn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
        _changeBtn.backgroundColor = UIColor.yellowColor;
        [_changeBtn addTarget:self action:@selector(changeAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _changeBtn;
}
@end
